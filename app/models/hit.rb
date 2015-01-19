class Hit < ActiveRecord::Base
  belongs_to :album

  geocoded_by :ip_address,
    latitude: :latitude,
    longitude: :longitude,
    region_code: :region_code
  after_validation :geocode

  def self.locations_to_csv
    CSV.generate do |csv|
      csv << %w(latitude UniqueVisits x)
    end
  end
end
