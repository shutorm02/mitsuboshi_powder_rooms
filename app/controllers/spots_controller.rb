class SpotsController < ApplicationController
  skip_before_action :require_login, only: %i[index show]
  before_action :find_spot, only %i[edit, update, destroy]

  def index
    @spots = Spot.all.includes(:equipment_details).order(created_at: :desc).page(params[:page])
    gon.spots = Spot.all
  end

  def new
    @form = SpotsForm.new
  end

  def create
    @form = SpotsForm.new(spot_params)

    if @form.save
      redirect_to spots_path, success: t('defaults.message.created', item: Spot.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_created', item: Spot.model_name.human)
      render :new
    end
  end

  def show
    @spot = Spot.find(params[:id])
    gon.spot = @spot
    @feedback_form = FeedbackForm.new
    @feedbacks = @spot.feedbacks.includes(:user, :feedback_tags, :tags).order(created_at: :desc).limit(3)
  end

  def edit
    @form = SpotsForm.new(spot: @spot)
  end

  def update
    @form = SpotsForm.new(spot_params, spot: @spot)

    if @form.save
      redirect_to @spot, success: 'The spot has been updated!'
    else
      flash.now['danger'] = 'The spot has not been updated'
      render :edit
    end
  end

  def destroy; end

  def likes
    @like_spots = current_user.like_spots.include(:user).arder(created_at: :desc)
  end

  private

  def spot_params
    params.require(:spots_form).permit(
      :name,
      :address,
      { equipment_detail_ids: [] },
    ).merge(user_id: current_user.id)
  end

  def find_spot
    @spot = current_user.spots.find(params[:id])
  end
end
