class LikesController < ApplicationController
  def create
    @spot = Spot.find(params[:spot_id])
    current_user.like(@spot)
  end

  def destroy
    @spot = current_user.likes.find(params[:id]).spot
    current_user.unlike(@spot)
  end
end
