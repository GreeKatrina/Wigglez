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

      user = Wigglez.db.get_user_by_email(params[:email])
      if !user
        return failure(:invalid_params, :reasons => { :email => ["is not associated with a user"] })
      end

      bcrpyt_password = BCrypt::Password.new(user.password_digest)
      if bcrpyt_password == params[:password]
        return success(user: user)
      else
        return failure(:invalid_params, :reasons => { :password => ["is incorrect"] })
      end
    end

  end
end
