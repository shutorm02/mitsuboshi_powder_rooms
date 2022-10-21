class SpotImagesController < ApplicationController
  before_action :require_login
  before_action :set_spot, only: %i[new create]
  before_action :find_spot, only: %i[edit update destroy]

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
    @spot.image.destroy!
    redirect_to spot_path(@spot), success: t('defaults.message.deleted', item: SpotImage.model_name.human)
  end

  private

  def set_spot
    @spot = current_user.spots.find(params[:spot_id])
  end
  
  def find_spot
    @spot = current_user.spots.find(params[:id])
  end

  def image_params
    params.require(:spot_image).permit(:image, :image_cache)
  end
end
