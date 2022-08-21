class Tag < ApplicationRecord
  has_many :feedback_tags, dependent: :destroy
  has_many :feedbacks, through: :feedback_tags
  belongs_to :target_person

  validates :content, uniqueness: true, presence: true
end
