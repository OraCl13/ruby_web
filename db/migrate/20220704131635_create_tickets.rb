class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.belongs_to :user
      t.belongs_to :train
      t.belongs_to :base_station
      t.belongs_to :end_station
    end
  end
end
