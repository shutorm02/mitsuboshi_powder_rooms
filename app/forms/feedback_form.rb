class FeedbackForm
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

  def save
    return false if invalid?

    ActiveRecord::Base.transaction do
      feedback = Feedback.new(feedback_params)
      feedback.save!

      if tag_ids.present?
        tag_ids.each do |tag_id|
          feedback.feedback_tags.create!(tag_id:)
        end
      end

      true
    end
  end

  private

  def feedback_params
    {
      rate:,
      feedback_comment:,
      user_id:,
      spot_id:,
    }
  end
end
