class RemoveReveivedFromWigs < ActiveRecord::Migration
  def change
    remove_column :wigs, :reveived?

    add_column :wigs, :received?, :boolean, :default => false
  end
end
