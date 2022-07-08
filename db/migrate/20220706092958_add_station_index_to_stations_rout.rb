class AddStationIndexToStationsRout < ActiveRecord::Migration[7.0]
  def change
    add_column :railway_stations_routs, :station_index, :integer
  end
end
