class Spot < ApplicationRecord
  belongs_to :user
  has_many :equipments, dependent: :destroy
  has_many :equipment_details, through: :equipments
  has_many :likes, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  has_one :image, dependent: :destroy, class_name: 'SpotImage', inverse_of: :spot

  validates :name, uniqueness: true
  validates :address, uniqueness: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  scope :latest, -> {order(created_at: :desc)}
  scope :by_rating, -> {
    left_joins(:feedbacks).group(:id).order("MAX(feedbacks.rate) DESC")
  }
  scope :by_equipments, ->(equipment_detail_ids) {
    where(equipment_details: {id: equipment_detail_ids})
      .group('spots.id').having('count(*) = ?', equipment_detail_ids.count)
  }
end
