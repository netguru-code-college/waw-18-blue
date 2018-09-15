class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.references :location, foreign_key: true
      t.float :latitude
      t.float :longitude
      t.string :address

      t.timestamps
    end
  end
end
