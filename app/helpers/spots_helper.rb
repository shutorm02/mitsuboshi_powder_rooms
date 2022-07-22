module SpotsHelper
  def tag_color(equipment_detail)
    case equipment_detail.target_person_id
    when 1, 2
      'powder-pink'
    when 3
      'baby-blue'
    when 4
      'fitting-pink'
    else
      'mitsuboshi-gray'
    end
  end
end
