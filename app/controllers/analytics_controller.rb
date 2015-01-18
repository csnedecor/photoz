class AnalyticsController < ApplicationController
  def index
    @album = Album.find(params[:album_id])
    @unique_visits_count = Visit.where(album: @album).count
    @pageviews = Hit.where(album: @album).count
    today = Time.now
    album_created_date = @album.created_at
    @visit_dates =
      (Date.parse(album_created_date.to_s)..Date.parse(today.to_s)).to_a
    if !signed_in?
      authenticate_user!
    elsif @album.user != current_user
      flash[:alert] = "You can't view another user's analytics"
      redirect_to album_path(@album)
    end
  end
end
