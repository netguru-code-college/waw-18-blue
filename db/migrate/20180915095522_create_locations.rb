class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :type
      t.boolean :is_przypal, null: false

      t.timestamps
    end
  end
end
