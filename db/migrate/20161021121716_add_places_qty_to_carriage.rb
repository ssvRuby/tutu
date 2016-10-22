class AddPlacesQtyToCarriage < ActiveRecord::Migration[5.0]
  def change
    change_table :carriages do |t|
      #-------------- Новые ------------------------
      t.integer :side_top_places_qty, default: 0
      t.integer :side_bottom_places_qty, default: 0
      t.integer :seats_qty, default: 0
      #-------------- Для STI ------------------------
      t.string  :type
    end
    #--------------- Изменяю старые -----------------------
    change_column :carriages, :number, 'integer USING (trim(number)::integer)'
    change_column_default :carriages, :top_places_qty, 0
    change_column_default :carriages, :bottom_places_qty, 0
  end
end
