class RenameColumnInTickets < ActiveRecord::Migration[5.0]
  def change
    rename_column :tickets, :first_station_id, :start_station_id
  end
end
