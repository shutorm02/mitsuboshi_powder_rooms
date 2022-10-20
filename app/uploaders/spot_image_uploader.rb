class SpotImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  if Rails.env.development? || Rails.env.test?
    storage :file
  else
    storage :fog
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    'spot_placeholder.png'
  end

  def extension_allowlist
    %w[jpg jpeg gif png]
  end

  def size_range
    0..8.megabytes
  end

  process resize_to_fill: [1100, 1000]
end
