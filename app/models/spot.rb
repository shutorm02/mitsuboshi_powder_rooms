class Spot < ApplicationRecord
  belongs_to :user
  has_many :equipments, dependent: :destroy
  has_many :equipment_details, dependent: :destroy, through: :equipments

  validates :name, uniqueness: true, presence: true
  validates :address, uniqueness: true, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
