class Analytic < ActiveRecord::Base
  STATES = [
    "AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DC", "DE", "FL", "GA", "HI",
    "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD", "ME", "MI", "MN",
    "MO", "MS", "MT", "NC", "ND", "NE", "NH", "NJ", "NM", "NV", "NY",  "OH",
    "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VA", "VT", "WA",
    "WI", "WV", "WY"
  ]

  def self.map_data(album)
    STATES.map do |state|
      {
        "hc-key" => state_key(state),
        "value" => album.total_hits_for_state(state)
      }
    end
  end

  def self.state_key(state)
    "us-#{state.downcase}"
  end
end
