class UsersController < ApplicationController

  before_action :redirect_logged_in_user, except: [:show, :index]

  def index
    render :index
  end

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login_user!(@user)
      flash[:notice] = "Sucessfully created new user."
      redirect_to user_url(@user)
    else
      raise "couldn't create"
      # flash[:error] = "Couldn't create user"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    if @user
      render :show
    else
      flash.now[:error] = "User does not exist"
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
