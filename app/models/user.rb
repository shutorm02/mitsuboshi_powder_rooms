class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader

  has_many :spots, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_spots, through: :likes, source: :spot
  has_many :feedbacks, dependent: :destroy
  has_many :spot_feedbacks, through: :spots, source: :feedback
  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :email, uniqueness: true, presence: true

  enum role: {
    general: 0,
    admin: 1,
  }

  def own?(object)
    id == object.user_id
  end

  def not_own(object)
    id != object.user_id
  end

  def like(spot)
    like_spots << spot
  end

  def unlike(spot)
    like_spots.destroy(spot)
  end

  def like?(spot)
    like_spots.include?(spot)
  end
end
