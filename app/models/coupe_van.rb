class CoupeVan < Van
  validates :bottom_seats, :top_seats, presence: true
end
