# encoding: utf-8

require 'carrierwave/processing/mime_types'

class PhotoUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  include CarrierWave::MimeTypes

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}/#{mounted_as}"
  end

  process :set_content_type

  process :resize_to_fit => [800, 800]

  version :small do
    process :resize_to_fill => [300,300]
  end

  version :thumb do
    process :resize_to_fill => [50,50]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg)
  end

  process :store_geometry

  def store_geometry
    if @file
      img = ::Magick::Image::read(@file.file).first
      if model
        model.width = img.columns
        model.height = img.rows
      end
    end
  end

end
