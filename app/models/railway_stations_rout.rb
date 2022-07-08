class RailwayStationsRout < ActiveRecord::Base
  belongs_to :railway_station
  belongs_to :rout

  validates :railway_station_id, uniqueness: { scope: :rout_id }
  validates :station_index, uniqueness: { scope: :rout_id }

  scope :order_by_station_index, -> {order(station_index: :asc)}
  scope :order_by_station_index_desc, -> {order(station_index: :desc)}

  before_validation :set_index
  after_destroy :set_index

  def set_index
    rout.railway_stations_routs.each_with_index do |element, ind|
      element.station_index = ind + 1
    end
  end
end
