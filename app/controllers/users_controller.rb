require 'securerandom'
class UsersController < ApplicationController
    def signup
      @user = User.new
    end
  
    def create
      @user = User.new(allowed_params)
      @user.token = generate_token
      if @user.save
        flash[:success] = "You signed up successfully"
        flash[:color]= "valid"
        SignUpMailer.user_confirmation(@user).deliver_later
      else
        flash[:alert] = "Form is invalid"
        flash[:color]= "invalid"
      end
      redirect_to signup_url
    end

    def verify
      token = params[:token]
      user = User.find_by(token: token)
      if user
        if user.update_attribute('is_verified', true)
          flash[:success] = "Verified"
          flash[:color]= "valid"
          redirect_back fallback_location: {controller: "sessions", action: "login"}
        else
          @verification_message = "Not Verified - Something went wrong"
        end
      else
        @verification_message = "Wrong Token"
      end
    end
  
    private
      def allowed_params
          params.require(:user).permit(:email, :password, :password_confirmation)
      end

      def generate_token
        token = SecureRandom.hex(32)
        if User.exists?(:token => token)
          return generate_token
        end
        return token
      end
end
  