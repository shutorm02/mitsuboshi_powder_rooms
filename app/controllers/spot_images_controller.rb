class SpotImagesController < ApplicationController
  before_action :require_login
  before_action :set_spot

  def new
    @image = @spot.image.new
  end

  def edit; end

  def create
    @image = @spot.image.new(image_params)

    if @image.save
      redirect_to spot_path(@spot), success: t('.success')
    else
      flash.now['danger'] = t('.fail', item: SpotImage.model_name.human)
      render :new
  end

  def destroy
    @image = @spot.image.find(params[:id])
    @image.destroy!
    redirect_to spot_path(@spot), success: t('.success')
  end

  private

  def set_spot
    @spot = current_user.spots.find(params[:spot_id])
  end
  
  def image_params
    params.require(:spot_image).permit(:spot_image, :spot_image_cache)
  end
end
