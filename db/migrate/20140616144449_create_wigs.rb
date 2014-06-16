class CreateWigs < ActiveRecord::Migration
  def change
    create_table :wigs do |t|
      t.integer :donor_id
      t.integer :receiver_id
      t.integer :tracking_number
      t.boolean :reveived?, :default => false
      t.string :material
      t.string :color
      t.string :length
      t.string :gender, :default => 'female'
      t.string :condition
      t.integer :retail_estimate
      t.integer :date_picked

      t.timestamps
    end
  end
end
