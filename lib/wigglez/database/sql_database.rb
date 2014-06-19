require 'pg'
require 'pry-byebug'

module Wigglez
  module Database
    class SQL
      def initialize
        config_path = File.expand_path('../../../../config/database.yml', __FILE__)
        config = YAML.load_file(config_path)
        app_env = ENV['DB_ENV'] || 'test'
        ActiveRecord::Base.establish_connection(config[app_env])
      end

      class User < ActiveRecord::Base
        has_many :wigs
      end

      class Wig < ActiveRecord::Base
        belongs_to :donor, :class_name => "User"
        belongs_to :receiver, :class_name => "User"
      end

      class Session < ActiveRecord::Base
        has_one :users
      end

      def create_user(attrs)
        new_user = User.create(attrs)
        Wigglez::User.new(new_user[:id], new_user[:name], new_user[:email], new_user[:password_digest])
      end

      def get_user(id)
        if User.exists?(id)
          new_user = User.find(id)
          Wigglez::User.new(new_user[:id], new_user[:name], new_user[:email], new_user[:password_digest])
        end
      end

      def get_user_by_email(email)
        if User.exists?(email: email)
          new_user = User.find_by email: email
          Wigglez::User.new(new_user[:id], new_user[:name], new_user[:email], new_user[:password_digest])
        end
      end

      def all_users
        users = User.all
        users.map do |u|
          u = Wigglez::User.new(new_user[:id], new_user[:name], new_user[:email], new_user[:password_digest])
        end
      end

      def delete_user(id)
        User.find(id).destroy
      end

      def create_wig(attrs)
        new_wig = Wig.create(attrs)
        Wigglez::Wig.new(
          new_wig.id,
          new_wig.donor_id,
          new_wig.receiver_id,
          new_wig.tracking_number,
          new_wig.received,
          new_wig.material,
          new_wig.color,
          new_wig.length,
          new_wig.gender,
          new_wig.retail_estimate,
          new_wig.date_picked,
          new_wig.condition,
          new_wig.construction,
          new_wig.size
        )
      end

      def get_wig(id)
        if Wig.exists?(id)
          new_wig = Wig.find(id)
          Wigglez::Wig.new(
            new_wig.id,
            new_wig.donor_id,
            new_wig.receiver_id,
            new_wig.tracking_number,
            new_wig.received,
            new_wig.material,
            new_wig.color,
            new_wig.length,
            new_wig.gender,
            new_wig.retail_estimate,
            new_wig.date_picked,
            new_wig.condition,
            new_wig.construction,
            new_wig.size
          )
        end
      end

      def all_wigs
        wigs = Wig.all
        wigs.map do |w|
          w = Wigglez::Wig.new(
              w.id,
              w.donor_id,
              w.receiver_id,
              w.tracking_number,
              w.received,
              w.material,
              w.color,
              w.length,
              w.gender,
              w.retail_estimate,
              w.date_picked,
              w.condition,
              w.construction,
              w.size
            )
        end
      end

      def delete_wig(id)
        Wig.find(id).destroy
      end

      def CLEAR_ALL
        Wig.delete_all
        User.delete_all
      end
    end
  end
end

