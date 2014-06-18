class ChangeDonorReceiverUser < ActiveRecord::Migration
  def change
    remove_column :wigs, :donor
    remove_column :wigs, :receiver

    add_column :wigs, :donor_id, :integer
    add_column :wigs, :receiver_id, :integer
  end
end
