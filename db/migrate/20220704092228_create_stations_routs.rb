class CreateStationsRouts < ActiveRecord::Migration[7.0]
  def change
    create_table :railway_stations_routes do |t|
      t.integer :railway_station_id
      t.integer :rout_id
    end
  end
end
