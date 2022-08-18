class Feedback < ApplicationRecord
  has_many :feedback_tags, dependent: :destroy
  has_many :tags, through: :feedback_tags
  belongs_to :user
  belongs_to :spot

  validates :rate, numericality: {
    less_than_or_equal_to: 3,
    greater_than_or_equal_to: 0.5,
  }, presence: true

  validates :feedback_comment, presence: true
end
