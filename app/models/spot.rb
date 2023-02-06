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

  scope :latest, -> { order(created_at: :desc) }
  scope :sort_by_total_rating, lambda {
    includes(:feedbacks).group(:id)
                        .sort_by do |spot|
                          feedbacks = spot.feedbacks
                          feedbacks.present? ? feedbacks.sum('feedbacks.rate') / feedbacks.size : 0
                        end
                        .reverse
  }
  scope :by_equipments, lambda { |equipment_detail_ids|
    left_joins(:equipment_details)
      .where(equipment_details: { id: equipment_detail_ids })
      .group('spots.id').having('count(*) = ?', equipment_detail_ids.count)
  }
end
