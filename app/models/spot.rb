class Spot < ApplicationRecord
  belongs_to :user
  has_many :equipments, dependent: :destroy
  has_many :equipment_details, through: :equipments
  has_many :likes, dependent: :destroy
  has_many :feedbacks, dependent: :destroy

  validates :name, uniqueness: true
  validates :address, uniqueness: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
