class OutageReport < ActiveRecord::Base
  belongs_to :service
  belongs_to :provider

  def wkt
    geometry
  end

  def geometry
    @geometry ||= GeoRuby::SimpleFeatures::Point.from_coordinates(location.split(', ').map(&:to_f).reverse)
  end
end
