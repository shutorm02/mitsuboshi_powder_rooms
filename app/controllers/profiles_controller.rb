class ProfilesController < ApplicationController
  before_action :require_login
  before_action :set_user, only: %i[edit update]

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profile_path, success: t('defaults.message.updated', item: User.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: User.model_name.human)
      render :edit
    end
  end

  def show
    @like_spots = current_user.like_spots.includes(:equipment_details).order(created_at: :desc)
    @feedbacks = current_user.feedbacks.includes(:tags).order(created_at: :desc)
    @post_spots = current_user.spots.includes(:equipment_details).order(created_at: :desc) 
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:email, :name, :avatar, :avatar_cache)
  end
end
