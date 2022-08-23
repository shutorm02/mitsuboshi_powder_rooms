class FeedbacksController < ApplicationController
  skip_before_action :require_login, only: %i[index]

  def index
    @spot = Spot.find(params[:spot_id])
    @feedbacks = @spot.feedbacks.includes(:user, :feedback_tags, :tags).order(created_at: :desc)
  end

  def new
    @spot = Spot.find(params[:spot_id])
    @feedback_form = FeedbackForm.new
  end

  def create
    feedback_form = FeedbackForm.new(feedback_params)
    if feedback_form.save
      redirect_to spot_path(feedback_form.spot_id),
                  success: t('defaults.message.created', item: Feedback.model_name.human)
    else
      redirect_to spot_path(feedback_form.spot_id),
                  danger: t('defaults.message.not_created', item: Feedback.model_name.human)
    end
  end

  def destroy; end

  private

  def feedback_params
    params.require(:feedback_form).permit(
      :rate,
      :feedback_comment,
      { tag_ids: [] },
    ).merge(user_id: current_user.id, spot_id: params[:spot_id])
  end
end
