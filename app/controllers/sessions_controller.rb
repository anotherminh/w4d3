class SessionsController < ApplicationController

  before_action :redirect_logged_in_user, except: [:destroy]

  def create
    user_name = user_params[:user_name]
    password = user_params[:password]
    @user = User.find_by_credentials(user_name, password)
    if @user
      login_user!(@user)
      redirect_to user_url(current_user)
    else
      raise 'cannot log in'
    end
  end

  def new
    render :new
  end

  def destroy
    if current_user
      current_user.reset_session_token!
      session[:session_token] = nil

      redirect_to new_session_url
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
