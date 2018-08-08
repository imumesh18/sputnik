class AdminController < ApplicationController
  def home
  	@application_info = UserInfo.where(status: "Applied")
  end
end
