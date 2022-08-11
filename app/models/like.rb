class Like < ApplicationRecord
  belongs_to :user
  belongs_to :spot

  validates :user_id, uniqueness: { scope: :spot_id }
end
