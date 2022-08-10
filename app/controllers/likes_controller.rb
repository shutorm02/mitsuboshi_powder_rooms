class LikesController < ApplicationController
  def create
    spot = Spot.find(params[:id])
    current_user.like(spot)
    redirect_back fallback_location: root_path, success: t('.success')
  end

  def destroy
    spot = current_user.likes.find(params[:id]).spot
    current_user.unlike(spot)
    redirect_back fallback_location: root_path, success: t('.success')
  end
end
