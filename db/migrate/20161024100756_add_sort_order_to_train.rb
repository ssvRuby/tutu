class AddSortOrderToTrain < ActiveRecord::Migration[5.0]
  def change
    add_column :trains, :sort_order, :boolean, default: true
  end
end
