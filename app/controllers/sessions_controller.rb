class SessionsController < ApplicationController

  before_action :authenticate_user, :except => [:login, :create, :logout]
  before_action :save_login_state, :only => [:login, :create]

  def login
  end
  
  def create
    authorized_user = authenticate(params[:login_email],params[:login_password])
    if authorized_user
      session[:user_id] = authorized_user.id
      redirect_to user_profile_path(session[:user_id]), notice: 'Logged in!'
    else
      flash[:notice] = "Invalid Email or Password or Email not Verified"
      flash[:color]= "invalid"
      redirect_to login_url
    end
  end
  
  def logout
    session[:user_id] = nil
    session[:admin_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end  

  private

  def authenticate(login_email="", login_password="")
    user = User.find_by_email(login_email)
    if user && user.match_password(login_password) && user.email_verified?
      return user
    else
      return false
    end
  end
end
