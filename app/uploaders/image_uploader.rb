# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  version :thumb do
    process resize_to_fill: [200, 200]
  end

  version :s120x85 do
    process resize_to_fill: [120, 85]
  end

  version :s78x52 do
    process resize_to_fill: [78, 52]
  end

  version :s589x325 do
    process resize_to_fill: [589, 325]
  end
end
