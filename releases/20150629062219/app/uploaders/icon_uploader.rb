# encoding: utf-8

class IconUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  PICTURE_EXTENTIONS = [".jpg", ".jpeg", ".png", ".gif", ".bmp"]
  IMAGE_EXTENSIONS = %w(jpg jpeg gif png)
  OTHER_EXTENSIONS = %w(svg)

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_fit => [16, 24], if: :image?


  def extension_white_list
    IMAGE_EXTENSIONS + OTHER_EXTENSIONS
  end

  def image?(img)
    img.content_type != "image/svg+xml"
  end
end
