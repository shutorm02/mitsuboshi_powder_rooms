class FeedbackTag < ApplicationRecord
  belongs_to :feedback
  belongs_to :tag
end
