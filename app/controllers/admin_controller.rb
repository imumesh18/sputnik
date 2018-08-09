class AdminController < ApplicationController
  before_action :authenticate_admin, :set_admin_info, :check_id
  def home
  	@pending_application = UserInfo.where(assigned_to: session[:admin_id]).order(:updated_at)
    @application_info = UserInfo.where(status: "Applied",assigned_to: nil).order(:updated_at)
  end

  def review_application
    @application=UserInfo.find(params[:application_id])
    if @application.assigned_to != nil && @application.assigned_to != session[:admin_id]
      flash[:alert] = "Application Already under review by other admin"
      return redirect_to admin_home_path(params[:id])
    end
    @application.update(assigned_to: params[:id])
  end
  
  private
  def set_admin_info
    @admin_info = Admin.find(session[:admin_id])
  end
  def check_id
    if params[:id] != session[:admin_id].to_s
      redirect_to admin_home_path(session[:admin_id])
    end
  end
end
