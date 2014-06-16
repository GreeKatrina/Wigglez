class AddColumnsToWigs < ActiveRecord::Migration
  def change
    remove_column :wigs, :donor_id
    remove_column :wigs, :receiver_id

    add_column :wigs, :donor, :integer
    add_column :wigs, :receiver, :integer
    add_column :wigs, :construction, :string
    add_column :wigs, :size, :string
  end
end
