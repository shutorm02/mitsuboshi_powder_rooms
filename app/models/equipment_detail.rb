class EquipmentDetail < ApplicationRecord
  has_many :equipments, dependent: :destroy
  has_many :spots, through: :equipments
  belongs_to :target_person

  validates :content, presence: true
end
