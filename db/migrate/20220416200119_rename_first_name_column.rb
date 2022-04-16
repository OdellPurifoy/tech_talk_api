class RenameFirstNameColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :firt_name, :first_name
  end
end
