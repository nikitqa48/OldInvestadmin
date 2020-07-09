# encoding: utf-8

class PictureFileUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  def store_dir
    "uploads/picture/#{mounted_as}/#{model.id}"
  end
  process :resize_to_fit => [1024, 768]

  version :thumb do
    process :resize_to_fit => [nil, 63]
  end

  version :medium do
    process :resize_to_fill => [300, 170]
  end

  version :small do
    process :resize_to_fit => [47, nil]
  end

  version :big do
    process :resize_to_fit => [800, nil]
  end

   def extension_white_list
     %w(jpg jpeg gif png)
   end
end