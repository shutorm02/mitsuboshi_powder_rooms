class Feedback < ApplicationRecord
  has_many :feedback_tags, dependent: :destroy
  has_many :tags, through: :feedback_tags
  belongs_to :user
  belongs_to :spot
end
