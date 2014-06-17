class ChangeWigReceivedColumn < ActiveRecord::Migration
  def change
    remove_column :wigs, :received?
    add_column :wigs, :received, :boolean, :default => false
  end
end
