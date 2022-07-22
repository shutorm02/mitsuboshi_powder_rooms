[
  [ 1, 1 ],
  [ 1, 2 ],
  [ 1, 3 ],
  [ 1, 4 ],
  [ 1, 5 ],
  [ 2, 1 ],
  [ 2, 2 ],
  [ 2, 3 ],
  [ 3, 3 ],
].each do |spot_id, equipment_detail_id|
  Equipment.create!(
    { spot_id: spot_id, equipment_detail_id: equipment_detail_id }
  )
end
