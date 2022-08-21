class FeedbackTag < ApplicationRecord
  belongs_to :feedback
  belongs_to :tag

  validates :feedback_id, uniqueness: { scope: :tag_id }
end
