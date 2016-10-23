class CarriageEconomy < Carriage
  validates :top_places_qty, :bottom_places_qty, :side_top_places_qty, :side_bottom_places_qty, presence: true
end
