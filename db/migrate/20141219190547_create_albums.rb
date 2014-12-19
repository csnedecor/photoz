class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string "name", null: false
      t.text "description"
      t.belongs_to "user"
      
      t.timestamps
    end
  end
end
