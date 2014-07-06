class UsersController < ApplicationController

  before_filter :authenticate_user!

  def show
    @user_id = session[:user_id]
    @user = Wigglez.db.get_user(@user_id)
    # @user_wigs = Wigglez::GetUserWigs.new(@user_id)
    render 'profile'
  end

  def index
    @user_id = session[:user_id]
    render 'home'
  end

end
