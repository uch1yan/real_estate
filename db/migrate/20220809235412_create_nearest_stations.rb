class CreateNearestStations < ActiveRecord::Migration[6.0]
  def change
    create_table :nearest_stations do |t|
      t.string :train_line
      t.string :station_name
      t.string :on_foot

      t.timestamps
    end
  end
end
