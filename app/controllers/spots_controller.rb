class SpotsController < ApplicationController
  def index
    @spots = Spot.all.order(created_at: :desc).page(params[:page])
  end
end
