class SpotsController < ApplicationController
  def index
    @spots = Spot.all.includes(:equipment_details).order(created_at: :desc).page(params[:page])
  end
end
