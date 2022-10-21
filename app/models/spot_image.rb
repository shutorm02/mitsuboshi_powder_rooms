class SpotImage < ApplicationRecord
  mount_uploader :image, SpotImageUploader
  belongs_to :spot

  validates :image, presence: true
end
