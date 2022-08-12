class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :spot

  validates :rate, presence: true
  validates :feedback_comment, presence: true
end
