class Essay < ActiveRecord::Base
  PHOTO_COUNT = 10

  attr_accessible :description, :title, :photo_1_caption, :photo_2_caption, :photo_3_caption, :photo_4_caption, :photo_5_caption, :photo_6_caption, :photo_7_caption, :photo_8_caption, :photo_9_caption, :photo_10_caption, :photo_1, :photo_2, :photo_3, :photo_4, :photo_5, :photo_6, :photo_7, :photo_8, :photo_9, :photo_10, :lat, :lng, :needs, :location, :map_zoom_level

  validates_presence_of :title, :location, :needs

  belongs_to :user

  has_many :photos

#  def photos(options = {})
#    options.reverse_merge!({ :size => nil })
#
#    photos = []
#
#    (1..PHOTO_COUNT).each do |x|
#      photo = self.send("photo_#{x}")
#      next if photo.blank?
#      url = options[:size] ? photo.send(options[:size]).url : photo.url
#      photos << { :url => url, :caption => self.read_attribute("photo_#{x}_caption") }
#    end
#
#    photos
#  end

  def needs_list
    output = read_attribute(:needs)
    output = '' if output.nil?
    output.gsub(', ', ',').split(',')
  end

  def first_photo
    photos.order('position ASC').first
  end
end
