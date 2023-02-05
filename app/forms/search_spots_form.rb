class SearchSpotsForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :created_at
  attribute :equipment_detail_ids

  def search
    relation = Spot.includes(:equipment_details).distinct
    relation = relation.by_equipments(equipment_detail_ids) if equipment_detail_ids.present?
    relation
  end
end
