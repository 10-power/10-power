class Essay < ActiveRecord::Base
  PHOTO_COUNT = 10

  attr_accessible :description, :title, :lat, :lng, :needs, :location, :map_zoom_level, :is_active, :is_featured, :notes

  validates_presence_of :title, :location, :needs

  belongs_to :user

  has_many :photos

  def needs_list
    output = read_attribute(:needs)
    output = '' if output.nil?
    output.split(/[\n\,]/).collect { |o| o.blank? ? nil : o.strip }.compact
  end

  def first_photo
    photos.order('position ASC').first
  end
end
