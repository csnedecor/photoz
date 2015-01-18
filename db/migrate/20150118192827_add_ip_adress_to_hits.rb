class AddIpAdressToHits < ActiveRecord::Migration
  def change
    add_column :hits, :ip_address, :string
  end
end
