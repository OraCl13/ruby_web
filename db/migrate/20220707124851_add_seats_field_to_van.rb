class AddSeatsFieldToVan < ActiveRecord::Migration[7.0]
  def change
    add_column :vans, :side_top_seats, :integer
    add_column :vans, :side_bottom_seats, :integer
    add_column :vans, :econom_seats, :integer
  end
end
