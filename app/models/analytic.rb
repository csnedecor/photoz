class Analytic < ActiveRecord::Base
  def self.map_data(album)
    states = [
      "AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DC", "DE", "FL", "GA", "HI",
      "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD", "ME", "MI", "MN",
      "MO", "MS", "MT", "NC", "ND", "NE", "NH", "NJ", "NM", "NV", "NY",  "OH",
      "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VA", "VT", "WA",
      "WI", "WV", "WY"
    ]
    map_data = []
    states.each do |state|
      value = 0
      album.hits.each do |hit|
        if hit.region_code == state
          value += 1
        end
      end
      map_data << { "hc-key" => "us-#{state.downcase}", "value" => value }
    end
    map_data
  end

end
