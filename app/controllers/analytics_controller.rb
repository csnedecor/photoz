class AnalyticsController < ApplicationController
  def index
    authenticate_user!
    @album = current_user.albums.find(params[:album_id])
    @unique_visits_count = @album.visits.count
    @pageviews = @album.hits.count
  end
end
