class AnalyticsController < ApplicationController

  def index
    @album = Album.find(params[:album_id])
    if !signed_in?
      authenticate_user!
    elsif @album.user != current_user
      flash[:alert] = "You can't view another user's analytics"
      redirect_to album_path(@album)
    end
  end

end
