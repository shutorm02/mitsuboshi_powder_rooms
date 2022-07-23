class SpotsController < ApplicationController
  def index
    @spots = Spot.all.includes(:equipment_details).order(created_at: :desc).page(params[:page])
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = current_user.spots.build(spot_params)
    if @spot.save
      redirect_to spots_path, success: t('defaults.message.created', item: Spot.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_created', item: Spot.model_name.human)
      render :new
    end
  end

  private

  def spot_params
    params.require(:spot).permit(:name, :address, :latitude, :longitude)
  end
end
