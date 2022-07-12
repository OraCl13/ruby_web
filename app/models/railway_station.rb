class RailwayStation < ApplicationRecord
  validates :title , presence: true

  has_many :trains
  has_many :railway_stations_routs, dependent: :destroy
  has_many :routs, through: :railway_stations_routs

  scope :ordered, -> { joins(:railway_stations_routs).order('railway_stations_routs.station_index').uniq }
  
  def update_position(rout, station_index)
    station_rout = station_rout(rout)
    station_rout.update(station_index: station_index) if station_rout
  end

  def position_in(rout)
    station_rout(rout).try(:station_index)
  end

  protected
  def station_rout(rout)
    @station_rout ||= railway_stations_routs.where(rout: rout).first
  end
end
