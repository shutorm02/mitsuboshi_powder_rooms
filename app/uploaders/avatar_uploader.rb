class AvatarUploader < CarrierWave::Uploader::Base
  if Rails.env.development? || Rails.env.test?
    storage :file
  else
    storage :fog
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    'sample.png'
  end

  def extension_whitelist
    %w[jpg jpeg gif png]
  end
end
