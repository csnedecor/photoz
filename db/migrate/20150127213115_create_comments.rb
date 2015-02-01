class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.belongs_to :user, null: false, index: true
      t.belongs_to :album, null: false, index: true

      t.timestamps
    end
  end
end
