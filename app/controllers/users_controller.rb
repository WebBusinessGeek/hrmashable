class UsersController < ApplicationController
  before_filter :require_login, except: [:login]

  def index
    @users = User.all
  end

  def edit
    @user ||= User.find(params[:id])
  end

  def update
    @user ||= User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to edit_user_path(@user), notice: 'Profile updated successfully!'
    else
      redirect_to edit_user_path(@user), alert: 'An error occoured while trying to update your profile! Please try again later...'
    end
  end

  def show
    @user ||= User.find(params[:id])
  end

  def login
    render layout: false

    session[:prev_path] = request.referrer
    if params[:provider] == 'google'
      redirect_to '/auth/google_oauth2'
    elsif params[:provider] == 'facebook'
      redirect_to '/auth/facebook'
    end
  end
end