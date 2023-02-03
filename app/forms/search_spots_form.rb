class SearchSpotsForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :created_at
  attribute :equipment_detail_ids

  def search
    relation = Spot.includes(:equipment_details).distinct

    if equipment_detail_ids.present?
      relation = relation.where(equipment_details: {id: equipment_detail_ids}) if equipment_detail_ids.present?
      spot_ids = relation.ids
      relation = Spot.includes(:equipment_details).where(id: spot_ids)
    end

    relation
  end

end