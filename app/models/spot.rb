class Spot < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end
