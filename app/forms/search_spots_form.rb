class SearchSpotsForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :equipment_detail_ids

  def search
    relation = Spot.includes(:equipment_details).distinct
  end

end