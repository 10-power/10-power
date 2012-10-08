class Photo < ActiveRecord::Base
  attr_accessible :file, :caption, :content_type, :file_size, :height, :position, :width

  mount_uploader :file, PhotoUploader

  belongs_to :essay
end
