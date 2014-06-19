require 'pry-byebug'

module Wigglez
  class SignIn < UseCase

    def run(params)
      params[:email] = params[:email].downcase

      result = validate_params(params) do

        validates_presence_of :email

        validates_presence_of :password

      end

      if !result.valid?
        return failure(:invalid_params, :reasons => result.errors.messages)
      end

      user = Wigglez.db.get_user(params[:user_id])
      bcrpyt_password = BCrypt::Password.new(user.password_digest)

      if bcrpyt_password == params[:password]
        return success(user)
      else
        return failure(:invalid_params, :reasons => "Incorrect Password.")
      end

    end

  end
end
