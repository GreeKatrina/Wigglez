require 'bcrypt'

class SessionsController < ApplicationController

  def sign_in_form

  end

  def sign_in

  end

  def sign_up_form

  end

  def sign_up

  end

  def login_attempt
    # authorized_user = User.authenticate(params[:email],params[:login_password])
    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
      redirect_to(:action => 'home')
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render "login"
    end
  end

  def home
  end

  def profile
  end

  def setting
  end

  def logout
    session[:user_id] = nil
    redirect_to :action => 'login'
  end
end
