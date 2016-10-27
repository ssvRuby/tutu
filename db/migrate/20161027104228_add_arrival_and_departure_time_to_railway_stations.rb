class AddArrivalAndDepartureTimeToRailwayStations < ActiveRecord::Migration[5.0]
  def change
    add_column :railway_stations_routes, :arrival_time, :string
    add_column :railway_stations_routes, :departure_time, :string
  end
end
