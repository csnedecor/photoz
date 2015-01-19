class Visit < ActiveRecord::Base
  belongs_to :album

  def self.todays_visits_to_csv(album)
    today = Time.now
    unique_visits = album.visits
    hits = album.hits
    visit_dates =
      (Date.parse(album.created_at.to_s)..Date.parse(today.to_s)).to_a

    CSV.generate do |csv|
      csv << %w(Pageviews UniqueVisits x)
      visit_dates.each do |date|
        daily_visit_count =
          unique_visits.where(
            [
              "created_at >= ? AND created_at <= ?",
              date.beginning_of_day,
              date.end_of_day
            ]
          ).count
        daily_hit_count = hits.where(
          [
            "created_at >= ? AND created_at <= ?",
            date.beginning_of_day,
            date.end_of_day
          ]
        ).count
        csv << [daily_hit_count, daily_visit_count, "#{date}"]
      end
    end
  end
end
