class Visit < ActiveRecord::Base
  belongs_to :album

  def self.todays_visits_to_tsv(album)
    today = Time.now
    unique_visits = Visit.where(album: album)
    album_created_date = album.created_at
    visit_dates = (Date.parse(album_created_date.to_s)..Date.parse(today.to_s)).to_a
    file = "visits.tsv"

    CSV.open(file, "w") do |csv|
      visit_dates.each do |date|
        daily_visit_count = unique_visits.where(["created_at >= ? AND created_at <= ?", date.beginning_of_day, date.end_of_day]).count
        csv << [daily_visit_count, "#{date.strftime('%d-%b-%y')}"]
      end
    end
    file
  end
end

# visits,date
# 0,15-Jan-15
# 2,16-Jan-15
