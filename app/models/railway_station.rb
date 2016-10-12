class RailwayStation < ApplicationRecord
  validates :title, presence:  true

  has_many :trains
  # has_and_belongs_to_many :routes
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

end
