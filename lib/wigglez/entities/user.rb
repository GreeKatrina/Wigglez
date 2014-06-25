module Wigglez
  class User
    attr_reader :id, :name, :email, :password_digest

    def initialize(attrs={})
      @id = attrs[:id]
      @name = attrs[:name]
      @email = attrs[:email]
      @password_digest = attrs[:password_digest]
    end
  end
end
