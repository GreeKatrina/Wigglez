class UsersController < ApplicationController
  before_action :current_user

  def show
    render 'profile'
  end

  def index
    render 'home'
  end

end
