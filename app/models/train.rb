class Train < ApplicationRecord
  validates :number , presence: true

  has_many :tickets
  belongs_to :rout
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
end
