class AddRegionCodeToHits < ActiveRecord::Migration
  def change
    add_column :hits, :region_code, :string
  end
end
