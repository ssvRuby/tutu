class RailwayStation < ApplicationRecord
  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence:  true

  scope :ordered, -> { find_by_sql('select s.title from railway_stations_routes r, railway_stations s where r.railway_station_id = s.id and route_id = 11 order by r.station_number')}
  # scope :ordered, -> { select("railway_stations.*, railway_stations_routes.station_number").joins(:railway_stations_routes).uniq.order("railway_stations_routes.station_number") }
  scope :ordered_by_title, -> { order(:title) }

  def update_position(route, position)
    current_record = RailwayStationsRoute.where(route_id: route.id).where(railway_station_id: self.id)

    if current_record.present?
      current_record.update(station_number: position)
    else
      # TODO: errors.add(:base, 'Станция в маршруте не найдена')
    end

  end

end
