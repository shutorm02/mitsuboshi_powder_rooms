module SpotsHelper
  def tag_color(equipment_detail)
    case equipment_detail.target_person_id
    when 1, 2
      'bg-powder-pink'
    when 3
      'bg-baby-blue'
    when 4
      'bg-fitting-pink'
    else
      'bg-mitsuboshi-gray'
    end
  end
end
