class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.date :start_time
      t.date :end_time

      t.timestamps
    end
  end
end
