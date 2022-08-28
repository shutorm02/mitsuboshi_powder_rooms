class SpotForm
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

  delegate :persisted?, :new_record?, to: :spot

  def initialize(attributes = nil, spot: Spot.new)
    @spot = spot
    attributes ||= default_attributes
    super(attributes)
  end

  def save
    return false if invalid?

    ActiveRecord::Base.transaction do
      spot.update!(spot_params)

      spot.equipments.destroy_all if spot.equipments.present?

      if equipment_detail_ids.present?
        equipment_detail_ids.each do |equipment_detail_id|
          spot.equipments.find_or_create_by!(equipment_detail_id:)
        end
      end
    end

    true
  end

  def to_model
    spot
  end

  private

  attr_reader :spot

  def default_attributes
    {
      name: spot.name,
      address: spot.address,
      equipment_detail_ids: spot.equipment_detail_ids,
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
