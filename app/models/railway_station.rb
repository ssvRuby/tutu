class RailwayStation < ApplicationRecord
  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence:  true

  scope :ordered, -> { select("railway_stations.*, railway_stations_routes.station_number").joins(:railway_stations_routes).uniq.order("railway_stations_routes.station_number") }

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(station_number: position) if station_route
  end

  def position_in(route)
    # station_route = railway_stations_routes.where(route: route).first
    station_route(route).try(:station_number)
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end

end
