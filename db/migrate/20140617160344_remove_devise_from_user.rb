class RemoveDeviseFromUser < ActiveRecord::Migration
  def change
    add_column :users, :salt, :string
    remove_index :users, :email
    remove_index :users, :reset_password_token
  end
end
