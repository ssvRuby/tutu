class RailwayStation < ApplicationRecord
  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence:  true

  #----------------------------------------------------------------------------------------------------------------
  # Этот вариант, из скринкаста, не работает:
  #
  # scope :ordered, -> { joins(:railway_stations_routes).order("railway_stations_routes.station_number").distinct }
  #
  # ERROR:  for SELECT DISTINCT, ORDER BY expressions must appear in select list
  # (RoR 5.0.0.1, PostgreSQL 9.6.0 on x86_64-apple-darwin)
  #----------------------------------------------------------------------------------------------------------------
  # Не работает именно отбор уникальных записей (без uniq/distinct - все нормально)
  # Почему - пока не понятно, лечится вставкой SELECT-а с явным описанием полей
  #----------------------------------------------------------------------------------------------------------------

  scope :ordered, -> { select("railway_stations.*, railway_stations_routes.station_number").joins(:railway_stations_routes).order("railway_stations_routes.station_number").distinct }
  scope :ordered_by_title, -> { order('title asc')}

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(station_number: position) if station_route
  end

  def position_in(route)
    station_route(route).try(:station_number)
  end

  def arrival_time(route)
    railway_stations_routes.where(route: route).first.arrival_time
  end

  def departure_time(route)
    railway_stations_routes.where(route: route).first.departure_time
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end

end
