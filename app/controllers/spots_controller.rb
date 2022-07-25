class SpotsController < ApplicationController
  skip_before_action :require_login, only: %i[index]

  def index
    @spots = Spot.all.includes(:equipment_details).order(created_at: :desc).page(params[:page])
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

  private

  def spot_params
    params.require(:spots_form).permit(
      :name,
      :address,
      { equipment_detail_ids: [] }
    ).merge(user_id: current_user.id)
  end
end
