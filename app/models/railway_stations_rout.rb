class RailwayStationsRout < ActiveRecord::Base
  belongs_to :railway_station
  belongs_to :rout

  validates :railway_station_id, uniqueness: { scope: :rout_id }
  # validates :station_index, uniqueness: { scope: :rout_id }

  scope :order_by_station_index, -> { order(station_index: :asc) }
  scope :order_by_station_index_desc, -> { order(station_index: :desc) }

  before_create :set_index

  def set_index
    self.station_index = rout.railway_stations_routs.pluck(:station_index).compact.max + 1
  end
end
