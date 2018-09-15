class AddAddressToLocation < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :address, :string
    add_column  :locations, :longitude, :float
    add_column :locations, :latitude, :float
  end
end
