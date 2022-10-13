module AdminHelper
  def include_latitude_and_longitude?(spot)
    spot.latitude && spot.longitude ? '○' : '☓'
  end
end
