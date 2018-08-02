class UserProfileController < ApplicationController
	def show
	  if check_id(params[:id])
      	@user_info = UserInfo.new
      	@display_profile = :home
      else
      	redirect_to user_profile_path(session[:user_id])
      end
  	end

  	def basic_details
  		@user_info = UserInfo.new
  		@display_profile = :basic_details
  		render "show"
  	end
  	
    def basic_details_submit
      @user_info = UserInfo.find_or_create_by(email: get_email_from_session_id)
      @user_info.update(allowed_params_basic_details)
      if @user_info.save
      	flash[:success] = "Basic Details Submitted"
      	redirect_to driving_license_path(session[:user_id])
      else
      	display_errors
      	redirect_to basic_details_path(session[:user_id])
      end
    end

    def driving_license
    	@user_info = UserInfo.find_or_create_by(email: get_email_from_session_id)
    	@display_profile = :driving_license
    	render "show"
    end

    def driving_license_submit
    	@user_info = UserInfo.find_or_create_by(email: get_email_from_session_id)
    	@user_info.update(allowed_params_driving_license)
    	if @user_info.save
    		flash[:success] = "Driving License Submitted"
    		redirect_to driving_license_path(session[:user_id])
    		# redirect to next form
    	else
      		display_errors
      		redirect_to driving_license_path(session[:user_id])
    	end
    end

    private
	    def allowed_params_basic_details
	      params.require(:user_info).permit(:full_name, :gender, :mobile, :dob) 
	    end

	    def allowed_params_driving_license
	      params.require(:user_info).permit(:driving_license) 
	    end

	    def get_email_from_session_id
	      user = User.find(session[:user_id])
	      user.email
	    end

	    def display_errors
	      if @user_info.errors.any?
	        errors = []
	        @user_info.errors.full_messages.each do |message|
	          errors<< message
	        end
	        flash[:alert] = errors.join("\n")
	      end
	    end

	    def check_id(id)
	    	id === session[:user_id].to_s
	    end
end
