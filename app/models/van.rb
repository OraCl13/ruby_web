class Van < ApplicationRecord
  TYPES = %w[CoupeVan PlacVan SvVan SeatVan].freeze
  belongs_to :train

  validates :train, :type, :number, presence: true
  validates :number, uniqueness: { scope: :train_id }

  before_validation :add_number

  def add_number
    self.number = self.max_number + 1
  end

  def max_number
    return 0 unless train && train.vans.pluck(:number).compact.max

    train.vans.pluck(:number).compact.max
  end

end
