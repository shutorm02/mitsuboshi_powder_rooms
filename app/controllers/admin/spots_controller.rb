class Admin::SpotsController < Admin::BaseController
  before_action :set_spot, only: %i[edit update show destroy]

  def index
    @spots = Spot.all.includes(:user).order(id: :asc)
  end

  def show; end

  def edit
    @admin_spot_form = AdminSpotForm.new(spot: @spot)
  end

  def update
    @admin_spot_form = AdminSpotForm.new(spot_params, spot: @spot)

    if @admin_spot_form.save
      redirect_to admin_spot_path(@spot), success: t('defaults.message.updated', item: Spot.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: Spot.model_name.human)
      render :edit
    end
  end

  def destroy
    @spot.destroy!
    redirect_to admin_spots_path, success: t('defaults.message.deleted', item: Spot.model_name.human)
  end

  private

  def set_spot
    @spot = Spot.find(params[:id])
  end

  def spot_params
    params.require(:spot).permit(
      :name,
      :address,
      :latitude,
      :longitude,
      { equipment_detail_ids: [] },
    ).merge(user_id: @spot.user_id)
  end
end
