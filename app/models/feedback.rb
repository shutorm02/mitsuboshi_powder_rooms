class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :spot

  validates :rate, numericality: {
    less_than_or_equal_to: 3,
    greater_than_or_equal_to: 1
  }, presence: true
  
  validates :feedback_comment, presence: true
end
