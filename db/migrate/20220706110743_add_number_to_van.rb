class AddNumberToVan < ActiveRecord::Migration[7.0]
  def change
    add_column :vans, :number, :integer
  end
end
