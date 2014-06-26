class WigsController < ApplicationController

  before_filter :authenticate_user!

  def new
    render 'new'
  end

  def create
    redirect_to show_wig
  end

  def index
    render 'index'
  end

  def show
    render 'show'
  end

  def edit
    render 'edit'
  end

  def update
    redirect_to show_wig
  end

  def destroy
    redirect_to root_url
  end

end
