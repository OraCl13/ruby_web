class AddUserColumnsToTicket < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :user_first_name, :string
    add_column :tickets, :user_last_name, :string
    add_column :tickets, :user_middle_name, :string
    add_column :tickets, :user_passport, :string
  end
end
