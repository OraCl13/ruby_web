class AddOrderVanToTrain < ActiveRecord::Migration[7.0]
  def change
    add_column :trains, :order_van, :boolean, default: false
  end
end
