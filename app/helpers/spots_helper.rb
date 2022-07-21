module SpotsHelper
  def tag_color(equipment_detail)
    if equipment_detail.target_person_id == 1
      return 'powder-pink'
    elsif equipment_detail.target_person_id == 2
      return 'powder-pink'
    elsif equipment_detail.target_person_id == 3
      return 'baby-blue'
    else equipment_detail.target_person_id == 4 
      return 'fitting-pink'
    end
  end
end
