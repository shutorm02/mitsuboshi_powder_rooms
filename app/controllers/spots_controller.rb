class SpotsController < ApplicationController
  skip_before_action :require_login, only: %i[index show]
  before_action :find_spot, only: %i[edit update destroy]
  before_action :set_equipment_details, only: %i[new edit]

  def index
    @search_spots_form = SearchSpotsForm.new(search_params)
    @spots = @search_spots_form.search.order(created_at: :desc)
    gon.spots = Spot.all
  end

  def new
    @form = SpotForm.new
  end

  def create
    @form = SpotForm.new(spot_params)

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
    @feedbacks = @spot.feedbacks.includes(:user, :feedback_tags, :tags).order(created_at: :desc).limit(3)
  end

  def edit
    @form = SpotForm.new(spot: @spot)
  end

  def update
    @form = SpotForm.new(spot_params, spot: @spot)

    if @form.save
      redirect_to @spot, success: t('defaults.message.updated', item: Spot.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: Spot.model_name.human)
      render :edit
    end
  end

  def destroy
    @spot.destroy
    redirect_to spots_path, success: t('defaults.message.deleted', item: Spot.model_name.human)
  end

  private

  def spot_params
    params.require(:spot).permit(
      :name,
      :address,
      { equipment_detail_ids: [] },
    ).merge(user_id: current_user.id)
  end

  def search_params
    params[:q]&.permit({ equipment_detail_ids: [] })
  end

  def find_spot
    @spot = current_user.spots.find(params[:id])
  end

  def set_equipment_details
    @equipment_details = EquipmentDetail.all.order(target_person_id: :asc, id: :asc)
  end
end
