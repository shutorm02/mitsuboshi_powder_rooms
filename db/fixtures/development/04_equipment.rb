[
  [ 1, 1 ],
].each do |spot_id, equipment_detail_id|
  Equipment.create!(
    { spot_id: spot_id, equipment_detail_id: equipment_detail_id }
  )
end
