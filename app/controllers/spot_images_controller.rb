class SpotImagesController < ApplicationController
  before_action :require_login
  before_action :set_spot

  def new
    @image = SpotImage.new
  end

  def edit; end

  def create
    @image = @spot.build_image(image_params)

    if @image.save
      redirect_to spot_path(@spot), success: t('defaults.message.added', item: SpotImage.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_added', item: SpotImage.model_name.human)
      render :new
    end
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
    params.require(:spot_image).permit(:image, :image_cache)
  end
end
