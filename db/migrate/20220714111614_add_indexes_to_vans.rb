class AddIndexesToVans < ActiveRecord::Migration[7.0]
  def change
    add_index :vans, [:type]
  end
end
