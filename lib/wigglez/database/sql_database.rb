require 'pg'

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
        has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
        validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
      end

      class Wig < ActiveRecord::Base
        paginates_per 10
        belongs_to :donor, :class_name => "User"
        belongs_to :receiver, :class_name => "User"
        has_attached_file :picture
      end

      class Session < ActiveRecord::Base
        has_one :users
      end

      def create_user(attrs)
        new_user = User.create!(attrs)
        Wigglez::User.new(new_user)
      end

      def get_user(id)
        if User.exists?(id)
          new_user = User.find(id)
          attrs = new_user.attributes.symbolize_keys
          attrs[:avatar] = new_user.avatar
          Wigglez::User.new(attrs)
        end
      end

      def get_user_by_email(email)
        if User.exists?(email: email)
          new_user = User.find_by email: email
          Wigglez::User.new(new_user)
        end
      end

      def all_users
        users = User.all
        users.map do |u|
          u = Wigglez::User.new(new_user)
        end
      end

      def delete_user(id)
        User.find(id).destroy
      end

      def create_wig(attrs)
        new_wig = Wig.create(attrs)
        Wigglez::Wig.new(new_wig)
      end

      def get_wig(id)
        if Wig.exists?(id)
          new_wig = Wig.find(id)
          Wigglez::Wig.new(new_wig)
        end
      end

      def update_wig(id, attrs={})
        if Wig.exists?(id)
          wig = Wig.find(id)
          wig.update(attrs)
          Wigglez::Wig.new(wig)
        end
      end

      def all_wigs
        wigs = Wig.all
        wigs.map do |w|
          w = Wigglez::Wig.new(w)
        end
      end

      def all_ar_wigs
        Wig.all
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

