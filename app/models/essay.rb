class Essay < ActiveRecord::Base
  PHOTO_COUNT = 10

  attr_accessible :description, :title, :photo_1_caption, :photo_2_caption, :photo_3_caption, :photo_4_caption, :photo_5_caption, :photo_6_caption, :photo_7_caption, :photo_8_caption, :photo_9_caption, :photo_10_caption, :photo_1, :photo_2, :photo_3, :photo_4, :photo_5, :photo_6, :photo_7, :photo_8, :photo_9, :photo_10

  validates_presence_of :title

  belongs_to :user

  mount_uploader :photo_1, PhotoUploader
  mount_uploader :photo_2, PhotoUploader
  mount_uploader :photo_3, PhotoUploader
  mount_uploader :photo_4, PhotoUploader
  mount_uploader :photo_5, PhotoUploader
  mount_uploader :photo_6, PhotoUploader
  mount_uploader :photo_7, PhotoUploader
  mount_uploader :photo_8, PhotoUploader
  mount_uploader :photo_9, PhotoUploader
  mount_uploader :photo_10, PhotoUploader

  def photos(options = {})
    options.reverse_merge!({ :thumb => true })
    
    photos = []

    (1..PHOTO_COUNT).each do |x|
      photo = self.send("photo_#{x}")
      logger.debug photo.inspect
      next if photo.blank?
      url = options[:thumb] ? photo.thumb.url : photo.url
      photos << { :url => url, :caption => self.read_attribute("photo_#{x}_caption") }
    end

    photos
  end
end