require 'pry'

class WigsController < ApplicationController
  before_filter :authenticate_user!

  # @AR_Wig = Wigglez::Database::SQL::Wig

  def new
    render 'new'
  end

  def create
    result = Wigglez::PostWig.new.run(wig_params, session[:user_id])
    if result.success?
      @wig = result.wig
      binding.pry
      redirect_to show_wig_path(@wig.id)
    else
      flash[:error] = result.reasons
      render 'new'
    end
  end

  def index
    # @wigs = @AR_Wig.order(created_at: :desc).page params[:page]
  end

  def show
    @wig = Wigglez.db.get_wig(params[:id])
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

  private

  def wig_params
    params.require(:wig).permit(:color, :length, :gender, :material, :construction, :condition, :size, :texture, :style, :retail_estimate)
  end

end
