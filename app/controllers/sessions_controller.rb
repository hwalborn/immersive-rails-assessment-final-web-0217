class SessionsController < ApplicationController

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to episodes_path
    else
      flash[:error] = "Incorrect Username or Password"
      redirect_to login_path
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end
end
