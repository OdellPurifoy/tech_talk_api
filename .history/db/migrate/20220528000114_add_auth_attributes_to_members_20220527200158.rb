class AddAuthAttributesToMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :authentication_token, :text
    add_column :members, :authentication_token_created_at, :datetime

    add_index :members, :authentication_token, unique: true
  end
end
