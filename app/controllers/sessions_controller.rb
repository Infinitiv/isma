class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_login(params[:login])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_first_name] = user.profile.first_name if user.profile.first_name
      session[:user_last_name] = user.profile.last_name if user.profile.last_name
      redirect_to root_path
    else
      redirect_to login_url, alert: "Error"
    end
  end

  def destroy
    session[:user_id] = nil
    session[:user_role] = nil
    redirect_to login_url, notice: "Logout"
  end

end
