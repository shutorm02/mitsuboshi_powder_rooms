class TargetPerson < ApplicationRecord
  has_one :equipment_detail, dependent: :destroy

  validates :people, uniqueness: true, presence: true
end
