class AddNullFalseToAlbumsUserId < ActiveRecord::Migration
  def change
    change_column_null :albums, :user_id, false
  end
end
