class RailwayStationsRout < ActiveRecord::Base
  belongs_to :railway_station
  belongs_to :rout

  validates :railway_station_id, uniqueness: { scope: :rout_id }
  validates :station_index, uniqueness: { scope: :rout_id }
end
