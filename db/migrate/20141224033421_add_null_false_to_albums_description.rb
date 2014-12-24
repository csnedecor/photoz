class AddNullFalseToAlbumsDescription < ActiveRecord::Migration
  def change
    change_column_null :albums, :description, false
  end
end
