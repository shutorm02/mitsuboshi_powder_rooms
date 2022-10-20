class SpotImageUploader < CarrierWave::Uploader::Base
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
end
