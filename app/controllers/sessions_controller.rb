class SessionsController < ApplicationController

  before_action :authenticate_user, :except => [:index, :login, :create, :logout]
  before_action :save_login_state, :only => [:index, :login, :create]

  def login
  end
  
  def create
    authorized_user = User.authenticate(params[:login_email],params[:login_password])
    if authorized_user
      session[:user_id] = authorized_user.id
      redirect_to user_profile_path(session[:user_id]), notice: 'Logged in!'
    else
      flash[:notice] = "Invalid Email or Password"
      flash[:color]= "invalid"
      redirect_to login_url
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end  
end
