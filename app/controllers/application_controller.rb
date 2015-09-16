class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def login_user!(user)
    # @user = User.find_by_credentials(user.user_name, user.password)
    # @user.ensure_session_token
    session[:session_token] = @user.session_token
  end

  def redirect_logged_in_user
    redirect_to cats_url if current_user
  end

end
