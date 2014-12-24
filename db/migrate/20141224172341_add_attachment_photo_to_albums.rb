class AddAttachmentPhotoToAlbums < ActiveRecord::Migration
  def self.up
    change_table :albums do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :albums, :photo
  end
end
