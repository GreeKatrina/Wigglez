class UsersController < ApplicationController

  before_filter :authenticate_user!

  def show
    @user_id = session[:user_id]
    render 'profile'
  end

  def index
    @user_id = session[:user_id]
    render 'home'
  end

end
