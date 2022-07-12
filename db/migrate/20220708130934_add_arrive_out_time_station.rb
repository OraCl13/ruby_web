class AddArriveOutTimeStation < ActiveRecord::Migration[7.0]
  def change
    add_column :railway_stations_routs, :arrive_time, :datetime
    add_column :railway_stations_routs, :outgo_time, :datetime
  end
end
