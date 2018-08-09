class AdminController < ApplicationController
  before_action :authenticate_admin, :set_admin_info

  def home
  	@pending_application = UserInfo.where(status: "pending", assigned_to: session[:admin_id]).order(:updated_at)
  	@application_info = UserInfo.where(status: "Applied").order(:updated_at)
  end


  private
  	def set_admin_info 
  		@admin_info = Admin.find(session[:admin_id])
  	end



end
