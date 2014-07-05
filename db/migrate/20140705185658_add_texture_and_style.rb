class AddTextureAndStyle < ActiveRecord::Migration
  def change
    add_column :wigs, :style, :string
    add_column :wigs, :texture, :string
  end
end
