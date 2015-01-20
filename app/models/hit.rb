class Hit < ActiveRecord::Base
  belongs_to :album

  geocoded_by :ip_address,
    latitude: :latitude,
    longitude: :longitude
  after_validation :geocode
end
