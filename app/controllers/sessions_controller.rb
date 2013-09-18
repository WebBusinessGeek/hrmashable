class SessionsController < ApplicationController
  def create
    user = Authorization.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.user.id
    redirect_to session[:prev_path], notice: '<center><h4>Logged in successfully!</h4></center>'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: '<center><h4>Logged out successfully!</h4></center>'
  end
end