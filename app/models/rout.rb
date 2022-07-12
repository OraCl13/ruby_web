class Rout < ApplicationRecord
  has_many :trains
  has_many :railway_stations_routs, dependent: :destroy
  has_many :railway_stations, through: :railway_stations_routs, dependent: :destroy

  validate :stations_count
  validates :name , presence: true

  before_validation :set_name

  # def self.search_for_routs(start_station, end_station)
  #   Rout.where(name: "#{start_station.title} - #{end_station.title}") # TODO
  # end

  def self.search_for_routs(start_station, end_station)
    Rout.all.map do |rout| rout if rout.railway_stations.include?(start_station) &&
      rout.railway_stations.include?(end_station)
    end
  end


  def set_name
    self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end

  def stations_count
    if railway_stations.to_a.count < 2
      errors.add(:base, 'Rout must have minimum 2 station')
    end
  end
end
