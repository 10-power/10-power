module ApplicationHelper
  def map_image_tag(essay, width = 300, height = 300, zoom = nil)
    zoom = essay.map_zoom_level || 8 if zoom.nil?
    image_tag "http://maps.googleapis.com/maps/api/staticmap?center=#{essay.lat},#{essay.lng}&zoom=#{zoom}&size=#{[width, height].join('x')}&sensor=false"
  end

  def textile(text)
    sanitize(RedCloth.new(text, [:filter_html, :filter_styles]).to_html)
  end
end
