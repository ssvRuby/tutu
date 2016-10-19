class CreateCarriages < ActiveRecord::Migration[5.0]
  def change
    create_table :carriages do |t|
      t.string  :number
      t.string  :carriage_type
      t.integer :top_places_qty
      t.integer :bottom_places_qty
      t.integer :train_id
      t.timestamps
    end
  end
end
