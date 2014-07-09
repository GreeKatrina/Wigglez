require 'active_record'
require 'paperclip'

module Wigglez
  def self.db
      @__db_instance ||= Database::SQL.new
  end
end

require_relative 'wigglez/entities/wig.rb'
require_relative 'wigglez/entities/user.rb'

require_relative 'wigglez/database/sql_database.rb'

# Users
require_relative 'wigglez/use_cases/use_case.rb'
require_relative 'wigglez/use_cases/users/sign_in.rb'
require_relative 'wigglez/use_cases/users/sign_up.rb'
require_relative 'wigglez/use_cases/users/edit_user.rb'
require_relative 'wigglez/use_cases/users/delete_user.rb'

# Wigs
require_relative 'wigglez/use_cases/wigs/browse_wigs.rb'
require_relative 'wigglez/use_cases/wigs/delete_wig.rb'
require_relative 'wigglez/use_cases/wigs/edit_wig.rb'
require_relative 'wigglez/use_cases/wigs/pick_wig.rb'
require_relative 'wigglez/use_cases/wigs/post_wig.rb'
require_relative 'wigglez/use_cases/wigs/get_user_wigs.rb'
