module Wigglez
  class User
    attr_reader :id, :name, :email, :password, :password_confirmation

    def initialize(id, name, email, password, password_confirmation)
      @id = id
      @name = name
      @password = password
      @password_confirmation = password_confirmation
    end
  end
end
