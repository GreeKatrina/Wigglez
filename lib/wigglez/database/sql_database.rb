require 'pg'
require 'pry-byebug'

module Wigglez
  module Database
    class SQL
      def initialize
        config_path = File.expand_path('../../../db/config.yml', __FILE__)
        config = YAML.load_file(config_path)
        app_env = ENV['DB_ENV'] || 'test'
        ActiveRecord::Base.establish_connection(config[app_env])
      end

      # def create_user(attrs)
      #   new_user = User.create(attrs)
      #   Wigglez::User.new(new_user[:id], new_user[:email], new_user[:password])
      # end

      def get_user(id)
      end

      def get_user_by_email(email)
      end

      def create_session(attrs)
      end

      def get_user_by_session_id(id)
      end

      def create_wig(attrs)
      end

      def get_wig(id)
      end

      def all_wigs
      end
    end
  end
end

