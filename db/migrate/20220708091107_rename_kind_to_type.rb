class RenameKindToType < ActiveRecord::Migration[7.0]
  def change
    remove_column :vans, :kind
    add_column :vans, :type, :string
  end
end
