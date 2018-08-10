class UserProfileController < ApplicationController
		before_action :seed_cities, :authenticate_user, :set_user_info, :check_id
		before_action :check_application_status, :except => [:show]
    @@possible_status_string = {:not_applied => "Not Applied", :applied =>  "Applied", :accepted => "Rejected", :rejected => "Accepted"}

  	def show
    	@display_profile = :home
    	render "show"
    end

  	def basic_details
  		@display_profile = :basic_details
  		render "show"
  	end
  	
    def basic_details_submit
      @user_info.update(allowed_params_basic_details)
      if not check_all_fields_basic_details_field(@user_info)
      	flash[:alert] = "Enter All Fields in the form"
      elsif @user_info.save
      	flash[:success] = "Basic Details Submitted"
      	return redirect_to driving_license_path(session[:user_id])
      else
      	display_errors
      end
      redirect_to basic_details_path(session[:user_id])
    end

    def driving_license
    	@display_profile = :driving_license
    	render "show"
    end

    def driving_license_submit
    	if @user_info.update(allowed_params_driving_license)
    		flash[:success] = "Driving License Submitted"
    		redirect_to vehicle_registration_card_path(session[:user_id])
    	else
      		display_errors
      		redirect_to driving_license_path(session[:user_id])
    	end
    end
		
		def vehicle_registration_card
    	@display_profile = :vehicle_registration_card
    	render "show"
		end

		def vehicle_registration_card_submit
    	@user_info.update(allowed_params_vehicle_registration_card)
    	if @user_info.save
    		flash[:success] = "Vehicle Registration Card Submitted"
    		redirect_to application_preview_path(session[:user_id])
    	else
      		display_errors
      		redirect_to vehicle_registration_card_path(session[:user_id])
    	end
		end

		def application_preview
    	@display_profile = :application_preview
    	render "show"
		end

    def apply
        @user_info.status=  @@possible_status_string[:applied]
        if @user_info.save
          flash[:success] = "Application Submitted"
          redirect_to user_profile_path(session[:user_id])
        else
            display_errors
            redirect_to application_preview_path(session[:user_id])
        end
    end

    private
    	def seed_cities
    		@cities = City.where(:is_enable == true)
    		@cities_names = []
    		@cities.each do |city|
    			@cities_names.push(city['name'])
    		end
    	end



    	def set_user_info
    		@user_info = UserInfo.find_or_create_by(email: get_email_from_session_id)
    	end

	    def allowed_params_basic_details
	      params.require(:user_info).permit(:full_name, :gender, :mobile, :dob, :city) 
	    end

	    def allowed_params_driving_license
	      params.require(:user_info).permit(:driving_license) 
			end
				
			def allowed_params_vehicle_registration_card
				params.require(:user_info).permit(:vehicle_registration_card) 
			end

	    def check_all_fields_basic_details_field(user_info)
	    	user_info['full_name'] != "" and user_info['dob'] != nil and user_info['mobile'] != nil and user_info['gender'] != "" and user_info['city'] != ""
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

	    def check_id
	    	if params[:id] != session[:user_id].to_s
	    		redirect_to user_profile_path(session[:user_id])
	    	end
			end
			
			def check_application_status
				if @user_info.status == "Applied"
					flash[:notice]="Application Submitted - It is under review"
					redirect_to user_profile_path(session[:user_id])
				elsif @user_info.status == "Accepted"
					flash[:notice]="Application Accepted - Welcome to Go-jek "
					redirect_to user_profile_path(session[:user_id])
				end
			end
end
