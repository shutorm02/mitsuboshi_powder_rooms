class FeedbacksController < ApplicationController
  def create
    feedback = current_user.feedbacks.build(feedback_params)
    if comment.save
      redirect_to spot_path(feedback.spot), success: t('default.message.created'), item: Feedback.model_name.human)
    else
      redirect_to spot_path(feedback.spot), danger: t('default.message.not_created'), item: Feedback.model_name.human)
    end
  end

  def destroy; end

  private

  def feedback_params
    params.require(:feedback).permit(:rate, :feedback_comment).merge(spot_id: params[:spot_id])
  end
end
