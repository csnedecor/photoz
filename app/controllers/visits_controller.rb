class VisitsController < ApplicationController
  def index
    @album = Album.find(params[:album_id])
    respond_to do |format|
      format.csv do
        render csv: Visit.daily_visits_to_csv(@album),
               filename: "visits.csv"
      end
    end
  end
end
