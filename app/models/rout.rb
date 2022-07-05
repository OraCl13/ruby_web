class Rout < ApplicationRecord
  has_many :trains
  has_many :railway_stations_routs
  has_many :railway_stations, through: :railway_stations_routs

  validates :name , presence: true
end
