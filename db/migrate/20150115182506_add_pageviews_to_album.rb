class AddPageviewsToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :pageviews, :integer, null: false, default: 0
  end
end
