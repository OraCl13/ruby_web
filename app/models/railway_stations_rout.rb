class RailwayStationsRout < ActiveRecord::Base
  belongs_to :railway_station
  belongs_to :rout

  validates :railway_station_id, uniqueness: { scope: :rout_id }
  validates :station_index, uniqueness: { scope: :rout_id }

  scope :order_by_station_index, -> { order(station_index: :asc) }
  scope :order_by_station_index_desc, -> { order(station_index: :desc) }

  after_create :set_index

  def set_index
    if rout.railway_stations_routs.pluck(:station_index).include? nil
      rout.railway_stations_routs.last.update(station_index:
                                                rout.railway_stations_routs.pluck(:station_index).compact.max + 1)
    end
    return if rout.railway_stations_routs.pluck(:station_index).compact.min == 1

    rout.railway_stations_routs.each do |rail_rout|
      rail_rout.update(station_index: rail_rout.station_index - 1) unless rail_rout.station_index.nil?
    end
  end
end
