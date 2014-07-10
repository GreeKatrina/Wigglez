require 'pry'
class UsersController < ApplicationController

  before_filter :authenticate_user!

  def show
    @user_id = session[:user_id]
    @user = Wigglez.db.get_user(@user_id)
    @user_wigs = Wigglez::GetUserWigs.new.run(@user.id)
    render 'profile'
  end

  def index
    @user_id = session[:user_id]
    @not_picked_wigs = Wigglez::GetUserWigs.new.not_picked(@user_id)
    @not_received_wigs = Wigglez::GetUserWigs.new.not_received(@user_id)
    render 'home'
  end

end
