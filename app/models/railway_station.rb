class RailwayStation < ApplicationRecord
  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence:  true

  scope :ordered, -> { select("railway_stations.*, railway_stations_routes.station_number").joins(:railway_stations_routes).uniq.order("railway_stations_routes.station_number") }
  scope :ordered_by_title, -> { order(:title) }

  def update_position(route, position)
    routes.where(route: route).update(station_number: position)
  end

end
