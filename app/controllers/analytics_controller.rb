class AnalyticsController < ApplicationController
  def index
    @album = Album.find(params[:album_id])
    @unique_visits = Visit.where(album: @album)
    @unique_visits_count = @unique_visits.count
    today = Time.now
    album_created_date = @album.created_at
    tsv = Visit.todays_visits_to_tsv(@album)
    @visit_dates = (Date.parse(album_created_date.to_s)..Date.parse(today.to_s)).to_a
    if !signed_in?
      authenticate_user!
    elsif @album.user != current_user
      flash[:alert] = "You can't view another user's analytics"
      redirect_to album_path(@album)
    end

  end
end
