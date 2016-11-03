class CreateTrainRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :train_routes do |t|
      t.string :title

      t.timestamps
    end
  end
end
