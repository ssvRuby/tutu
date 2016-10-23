class CarriageCoupe < Carriage
  validates :top_places_qty, :bottom_places_qty, presence: true
end