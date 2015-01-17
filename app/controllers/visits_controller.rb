class VisitsController < ApplicationController
  def index
    @album = Album.find(params[:album_id])
    respond_to do |format|
      format.csv {
        render csv: Visit.todays_visits_to_csv(@album),
        filename: "visits.csv"
      }
    end
  end
end
