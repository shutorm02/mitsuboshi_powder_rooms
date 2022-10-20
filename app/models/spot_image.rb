class SpotImage < ApplicationRecord
  mount_uploader :image, SpotImageUploader
  belongs_to :spot
end
