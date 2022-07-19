class Equipment < ApplicationRecord
  belongs_to :spot
  belongs_to :equipment_detail

  validates :spot_id, uniqueness: { scope: :equipment_detail_id }
end
