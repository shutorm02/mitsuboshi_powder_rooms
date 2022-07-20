class Spot < ApplicationRecord
  belongs_to :user
  has_many :equipments, dependent: :destroy
  has_many :equipment_details, dependent: :destroy
  has_many :equipment_equipment_details, through: :equipments, source: :equipment_details

  validates :name, presence: true
  validates :address, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end