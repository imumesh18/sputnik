class AdminSessionController < ApplicationController
	def login
		p "login"
		save_admin_login_state
	end

	def create
		authorized_admin = authenticate(params[:login_email],params[:login_password])
		if authorized_admin
		  session[:admin_id] = authorized_admin.id
		  redirect_to admin_home_path(session[:admin_id]), notice: 'Logged in!'
		else
		  flash[:notice] = "Invalid Email or Password or Email not Verified"
		  flash[:color]= "invalid"
		  redirect_to admin_login_url
		end
	end

	private
	def authenticate(login_email="", login_password="")
	  user = Admin.find_by_email(login_email)
	  if user && user.match_password(login_password) && user.email_verified?
	    return user
	  else
	    return false
	  end
	end

	# So that when already login admin cannot see login page 
	def save_admin_login_state
	  if session[:admin_id]
	          redirect_to admin_home_path(session[:admin_id]), notice: 'Already Logged in!'
	    return false
	  else
	    return true
	  end
	end
end

