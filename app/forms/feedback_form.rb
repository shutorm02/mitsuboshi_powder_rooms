Class FeedbackForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :rate, :float
  attribute :feedback_comment, :string
  attribute :tag_ids
  attribute :user_id, :integer
  attribute :spot_id, :integer

  with_options presence: true do
    validates :rate, numericality: {
      less_than_or_equal_to: 3,
      greater_than_or_equal_to: 0.5,
    }
    validates :feedback_comment
    validates :user_id
    validates :spot_id
  end
end
