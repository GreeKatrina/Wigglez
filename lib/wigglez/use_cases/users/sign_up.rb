require 'wigglez'
require 'pry-byebug'
require 'bcrypt'

module Wigglez
  class SignUp < UseCase

    def run(params)
      params[:email] = params[:email].downcase

      result = validate_params(params) do
        validates :name, :presence => true, length: { maximum: 50 }
        validates :password, :presence => true, length: { in: 6..20 }, confirmation: true
        validates_presence_of :email
        validates_format_of :email, with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

        validates_presence_of :avatar
        # validates_inclusion_of :avatar_content_type, :in => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
        # validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
        # validates_attachment_content_type :avatar, :content_type => /\Aimage/
        # validates_attachment_size :avatar, :less_than => 5.megabytes
      end

      if !result.valid?
        return failure(:invalid_params, :reasons => result.errors.messages)
      end

      user = Wigglez.db.get_user_by_email(params[:email])
      if user
        return failure(:invalid_params, :reasons => { :email => ["is already taken"] })
      end

      params.delete(:password_confirmation)
      password = params.delete(:password)
      password_digest = BCrypt::Password.create(password)
      params[:password_digest] = password_digest
      user = Wigglez.db.create_user(params)
      return success(user: user)

    end

  end
end
