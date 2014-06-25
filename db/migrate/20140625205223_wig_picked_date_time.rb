class WigPickedDateTime < ActiveRecord::Migration
  def change
    remove_column :wigs, :date_picked
    add_column :wigs, :date_picked, :datetime
  end
end
