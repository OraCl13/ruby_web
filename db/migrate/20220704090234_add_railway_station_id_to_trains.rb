class AddRailwayStationIdToTrains < ActiveRecord::Migration[7.0]
  def change
    # add_column :trains, :railway_station_ID, :integer
    add_belongs_to :trains, :current_station
  end
end
