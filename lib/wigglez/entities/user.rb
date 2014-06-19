module Wigglez
  class User
    attr_reader :id, :name, :email, :password_digest

    def initialize(id, name, email, password_digest)
      @id = id
      @name = name
      @email = email
      @password_digest = password_digest
    end
  end
end
