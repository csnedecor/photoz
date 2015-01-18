class AddLatitudeAndLongitudeToHits < ActiveRecord::Migration
  def change
    add_column :hits, :latitude, :float
    add_column :hits, :longitude, :float
  end
end
