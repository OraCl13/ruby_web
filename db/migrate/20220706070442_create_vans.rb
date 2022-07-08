class CreateVans < ActiveRecord::Migration[7.0]
  def change
    create_table :vans do |t|
      t.string :kind
      t.integer :top_seats
      t.integer :bottom_seats
      t.references :train

    end
  end
end
