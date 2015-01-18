class RemovePageviewsFromAlbums < ActiveRecord::Migration
  def change
    remove_column :albums, :pageviews, :integer, null: false, default: 0
  end
end
