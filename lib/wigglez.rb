require 'pry-byebug'
require 'active_record'

module Wigglez
  def self.do
    if @__db_instance.nil?
      if ENV['DB_ENV'] == 'test'
        @__db_instance = Database::SQL.new
      else
        @__db_instance = Database::SQL.new
      end
    end
    @__db_instance
  end
end

require_relative 'wigglez/entities/user.rb'
require_relative 'wigglez/entities/wig.rb'

require_relative 'wigglez/database/sql_database.rb'

require_relative 'wigglez/use_cases/sign_in.rb'
