# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base
include CarrierWave::MiniMagick
 storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Add a white list of extensions which are allowed to be uploaded.
  def extension_white_list
    %w(jpg jpeg gif png)
  end
   def default_url
      "/default/avatar.png"
    end
end
