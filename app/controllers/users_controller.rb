class UsersController < ApplicationController

  before_filter :authenticate_user!

  def show
    render 'profile'
  end

  def index
    render 'home'
  end

end
