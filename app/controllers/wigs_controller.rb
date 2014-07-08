require 'pry'

class WigsController < ApplicationController
  before_filter :authenticate_user!

  def new
    render 'new'
  end

  def create
    result = Wigglez::PostWig.new.run(wig_params, session[:user_id])
    if result.success?
      @wig = result.wig
      redirect_to posted_wig_path(@wig.id)
    else
      flash[:error] = result.reasons
      render 'new'
    end
  end

  def index
    search_params = { created_at: :desc }
    search_params[:color] = params[:color] if params[:color]
    search_params[:length] = params[:length] if params[:length]
    search_params[:gender] = params[:gender] if params[:gender]
    search_params[:material] = params[:material] if params[:material]
    search_params[:construction] = params[:construction] if params[:construction]
    search_params[:condition] = params[:condition] if params[:condition]
    search_params[:size] = params[:size] if params[:size]
    search_params[:texture] = params[:texture] if params[:texture]
    search_params[:style] = params[:style] if params[:style]
    search_params[:retail_estimate] = [0..75] if params[:retail_estimate] == "level_one"
    search_params[:retail_estimate] = [75..250] if params[:retail_estimate] == "level_two"
    search_params[:retail_estimate] = [250..750] if params[:retail_estimate] == "level_three"
    search_params[:retail_estimate] = [750..2000] if params[:retail_estimate] == "level_four"
    search_params[:retail_estimate] = [2000..Float::INFINITY] if params[:retail_estimate] == "level_five"
    @wigs = Wigglez.db.all_ar_wigs.order(search_params).page params[:page]
  end

  def show
    @wig = Wigglez.db.get_wig(params[:id])
    render 'show'
  end

  def posted
    @wig = Wigglez.db.get_wig(params[:id])
    render 'posted'
  end

  def edit
    render 'edit'
  end

  def update
    redirect_to show_wig
  end

  def pick
    result = Wigglez::PickWig.new.run(params[:id], session[:user_id])
    if result.success?
      @wig = result.wig
      redirect_to root_url
    else
      flash[:error] = result.reasons
      render 'show'
    end
  end

  def destroy
    redirect_to root_url
  end

  private

  def wig_params
    params.require(:wig).permit(:color, :length, :gender, :material, :construction, :condition, :size, :texture, :style, :retail_estimate)
  end

end
