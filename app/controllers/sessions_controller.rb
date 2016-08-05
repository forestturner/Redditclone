class SessionsController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials( user_params[:username], user_params[:password] )
    if @user
      login(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = "invalid credentials"
      render :new
    end
  end

  def destroy
    logout(current_user)
    redirect_to subs_url
  end

  private
  def user_params
    params.require(:user).permit(:username,:password)
  end
end
