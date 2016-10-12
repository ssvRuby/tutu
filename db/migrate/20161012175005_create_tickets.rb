class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :number
      t.integer :user_id
      t.integer :train_id
      t.integer :user_id
      t.integer :first_station_id
      t.integer :end_station_id
      t.timestamps
    end
  end
end
