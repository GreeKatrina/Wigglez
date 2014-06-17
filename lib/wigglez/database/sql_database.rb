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

        before_save { self.email = email.downcase }

        has_secure_password

        validates :name,  presence: true, length: { maximum: 50 }
        VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
        validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
        validates :password, length: { :in => 6..20 }

      end

      class Wig < ActiveRecord::Base
        belongs_to :donor, :class_name => "User"
        belongs_to :receiver, :class_name => "User"
      end

      def create_user(attrs)

      end

      def create_wig(attrs)
        # new_wig = Wig.create(attrs)
        # Wigglez::Database::SQL::Wig.new(
        #     new_wig.id,
        #     new_wig.donor,
        #     new_wig.receiver,
        #     new_wig.tracking_number,
        #     new_wig.received,
        #     new_wig.material,
        #     new_wig.color,
        #     new_wig.length,
        #     new_wig.gender,
        #     new_wig.retail_estimate,
        #     new_wig.date_picked,
        #     new_wig.condition,
        #     new_wig.construction,
        #     new_wig.size
        #   )
      end

      def get_wig(id)
      end

      def all_wigs
      end

      def CLEAR_ALL
        Wig.delete_all
      end
    end
  end
end

