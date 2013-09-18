class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def require_login
    if !current_user
      redirect_to :back, alert: '<center><h5>You must be logged in to perform this action!</h5></center>'
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end