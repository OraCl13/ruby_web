class Train < ApplicationRecord
  validates :number , presence: true

  has_many :vans
  has_many :tickets, dependent: :destroy

  belongs_to :rout
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id

  def sum_seats_by_van_type(van_type, seat_type)
    vans.where(type: van_type).sum(seat_type) # train.sum_seats_by_van_type('SvVan', 'bottom_seats')
  end
end
