class AddIndexesToDb < ActiveRecord::Migration[5.0]
  def change
    add_index :railway_stations_routes, [:railway_station_id, :route_id], unique: true, name: 'staton_route_i'
    add_index :carriages, [:id, :type]
    add_index :tickets, :user_id
    add_index :tickets, [:start_station_id, :end_station_id]
  end
end
