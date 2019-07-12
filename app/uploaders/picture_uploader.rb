class PictureUploader < CarrierWave::Uploader::Base

  storage :file
  process resize_to_limit: [400, 400]
  # Choose what kind of storage to use for this uploader:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end
