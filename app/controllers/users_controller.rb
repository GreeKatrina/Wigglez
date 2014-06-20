class UsersController < ApplicationController
  before_action :current_user

  def show
    # Render user profile page
    render 'profile'
  end

  def index
    # Render user home page
    render 'home'
  end

end
