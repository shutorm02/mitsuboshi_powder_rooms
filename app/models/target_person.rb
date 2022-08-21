class TargetPerson < ApplicationRecord
  has_one :equipment_detail, dependent: :destroy
  has_one :tag, dependent: :destroy

  validates :target, uniqueness: true, presence: true
end
