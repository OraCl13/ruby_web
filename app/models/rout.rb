class Rout < ApplicationRecord
  has_many :trains
  has_many :railway_stations_routs, dependent: :destroy
  has_many :railway_stations, through: :railway_stations_routs

  validate :stations_count
  validates :name , presence: true

  after_validation :set_name

  def set_name
    self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end

  def stations_count
    if railway_stations.to_a.count < 2
      errors.add(:base, 'Rout must have minimum 2 station')
    end
  end
end
