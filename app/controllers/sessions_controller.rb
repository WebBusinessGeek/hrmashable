class SessionsController < ApplicationController
  def create
    user = Authorization.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end