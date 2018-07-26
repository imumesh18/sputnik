class UsersController < ApplicationController
    def signup
      @user = User.new
    end
  
    def create
      @user = User.new(allowed_params)
      if @user.save
        flash[:notice] = "You signed up successfully"
        flash[:color]= "valid"
      else
        flash[:notice] = "Form is invalid"
        flash[:color]= "invalid"
      end
      render :signup
    end
  
    private
  
    def allowed_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end      
end
  