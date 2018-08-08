class AdminController < ApplicationController
  def index
  end
  
  def home
  	@application_info = UserInfo.where(status: "Applied")
  end

end
