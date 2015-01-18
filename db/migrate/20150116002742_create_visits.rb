class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.belongs_to :album, null: false, index: true
      t.string :ip_address, null: false

      t.timestamps
    end
  end
end
