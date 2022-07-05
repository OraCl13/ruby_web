class RailwayStation < ApplicationRecord
  validates :title , presence: true

  has_many :trains
  has_many :railway_stations_routs
  has_many :routs, through: :railway_stations_routs
end
