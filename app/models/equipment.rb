class Equipment < ApplicationRecord
  belongs_to :spot
  belongs_to :equipment_detail
end
