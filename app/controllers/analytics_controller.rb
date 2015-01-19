class AnalyticsController < ApplicationController
  def index
    authenticate_user!
    @album = current_user.albums.find(params[:album_id])
    @unique_visits_count = @album.visits.count
    @pageviews = @album.hits.count
    states = [
      "AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DC", "DE", "FL", "GA", "HI",
      "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD", "ME", "MI", "MN",
      "MO", "MS", "MT", "NC", "ND", "NE", "NH", "NJ", "NM", "NV", "NY",  "OH",
      "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VA", "VT", "WA",
      "WI", "WV", "WY"
    ]
    @map_data = []
    states.each do |state|
      value = 0
      @map_data << { "hc-key" => "us-#{state.downcase}", "value" => value }
      @album.hits.each do |hit|
        if hit.region_code == state
          value += 1
        end
      end
    end
  end
end
