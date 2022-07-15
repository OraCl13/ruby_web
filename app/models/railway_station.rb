class RailwayStation < ApplicationRecord
  validates :title, presence: true

  has_many :trains
  has_many :railway_stations_routs, dependent: :destroy
  has_many :routs, through: :railway_stations_routs

  scope :ordered, -> { joins(:railway_stations_routs).order('railway_stations_routs.station_index').uniq }

  def update_position(rout, station_index)
    station_rout = station_rout(rout)

    if rout.railway_stations_routs.pluck(:station_index).include?(station_index.to_i)
      obj_default = rout.railway_stations_routs.find_by(station_index: station_index.to_i)
      obj_to_replace = rout.railway_stations_routs.find_by(station_index: station_rout.station_index)
      if obj_default != obj_to_replace
        obj_default.update(station_index: station_rout.station_index)
        obj_to_replace.update(station_index: station_index.to_i)
      end
    end

    station_rout.update(station_index: station_index) if station_rout
    return if station_rout.rout.railway_stations_routs.pluck(:station_index).compact.min == 1

    rout.railway_stations_routs.each do |rail_rout|
      rail_rout.update_attribute(:station_index, rail_rout.station_index - 1) # TODO 3&3
    end
  end

  def position_in(rout)
    station_rout(rout).try(:station_index)
  end

  protected

  def station_rout(rout)
    @station_rout ||= railway_stations_routs.where(rout: rout).first
  end
end
