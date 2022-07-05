class AddRoutToTrain < ActiveRecord::Migration[7.0]
  def change
    add_column :trains, :rout_id, :integer
  end
end
