class RemoveColumnsFromUsers < ActiveRecord::Migration
  def change
    remove_columns :users, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :last_sign_in_ip, :current_sign_in_ipb
  end
end
