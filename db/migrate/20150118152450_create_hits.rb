class CreateHits < ActiveRecord::Migration
  def change
    create_table :hits do |t|
      t.belongs_to :album, null: false, index: true
      
      t.timestamps
    end
  end
end
