class SessionsController < ApplicationController

  def new
    if session[:user_id]
      redirect_to home_path and return
    end
    render layout: 'layouts/landing_page'
  end

  def sign_in
    if session[:user_id]
      redirect_to home_path
    end
    flash[:error] = nil
  end

  def sign_in_attempt
    result = Wigglez::SignIn.new.run(user_params)
    if result.success?
      session[:user_id] = result.user.id
      @user = result.user
      redirect_to home_path
    else
      flash[:error] = result.reasons
      render 'sign_in'
    end
  end

  def sign_up
    if session[:user_id]
      redirect_to home_path
    end
    flash[:error] = nil
  end

  def sign_up_attempt
    result = Wigglez::SignUp.new.run(user_params)
    if result.success?
      session[:user_id] = result.user.id
      @user = result.user
      redirect_to home_path
    else
      flash[:error] = result.reasons
      render 'sign_up'
    end
  end

  def destroy
    if session[:user_id]
      session[:user_id] = nil
      flash[:log_out] = "You have successfully Logged out."
    end
    redirect_to root_url
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

end
