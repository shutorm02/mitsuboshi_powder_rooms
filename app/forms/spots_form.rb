class SpotsForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :address, :string
  attribute :user_id, :integer
  attribute :equipment_detail_ids

  with_options presence: true do
    validates :name
    validates :address
    validates :user_id
  end

  def save
    return false if invalid?

    ActiveRecord::Base.transaction do
      spot = Spot.new(spot_params)
      spot.save!

      equipment_detail_ids.each do |equipment_detail_id|
        spot.equipments.create!(equipment_detail_id: equipment_detail_id)
      end
    end

   true 
  end

  private

  def spot_params
    {
      name: name,
      address: address,
      user_id: user_id
    }
  end
end
