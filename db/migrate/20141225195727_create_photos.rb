class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.attachment :photo
      t.belongs_to :album, index: true
    end
  end
end
