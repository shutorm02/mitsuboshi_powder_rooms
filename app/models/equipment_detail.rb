class EquipmentDetail < ApplicationRecord
  has_many :equipments, dependent: :destroy
  has_many :spots, through: :equipments
end
