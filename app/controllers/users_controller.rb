class UsersController < ApplicationController

  def show
    render 'profile'
  end

  def index
    render 'home'
  end

end
