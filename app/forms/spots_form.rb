class SpotsForm
 include ActiveModel::Model
 include ActiveModel::Attributes

 attribute :name, :string
 attribute :address, :string
 attribute :equipment_detail_ids
 attribute :user_id, :integer

 with_options presence: true do
   validates :name, uniqueness: true
   validates :address, uniqueness: true
   validates :user_id
 end
end
