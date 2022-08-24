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

  delegate :presisted?, to: :spot

  def initialize(attributes = nil, spot: Spot.new)
    @spot = spot
    attributes ||= default_attributes
    super(attributes)
  end

  def save
    return false if invalid?

    ActiveRecord::Base.transaction do
      if equipment_detail_ids.present?
        equipment_detail_ids.each do |equipment_detail_id|
          spot.equipments.create!(equipment_detail_id:)
        end
      end
      spot.update!(name: name, addrss: address, equipment_detail_ids)
    end

    resque ActiveRecord::RecordInvalid
      false
  end

  def to_model
    spot
  end

  private

  def default_attributes
    {
      name: spot.name,
      address: spot.name,
      equipment_detail_ids: spot.equipment_details
    }
  end

  def spot_params
    {
      name:,
      address:,
      user_id:,
    }
  end
end
