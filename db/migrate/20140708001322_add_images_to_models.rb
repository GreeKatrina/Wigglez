class AddImagesToModels < ActiveRecord::Migration
  def self.up
      add_attachment :users, :avatar
      add_attachment :wigs, :picture
    end

    def self.down
      remove_attachment :users, :avatar
      remove_attachment :wigs, :picture
    end
end
