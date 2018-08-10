class SubmissionController < ApplicationController
    before_action :authenticate_admin, :set_admin_info, :check_id
    def update_status
        @application = UserInfo.where(id: params[:application_id],assigned_to: params[:id]).first
        if @application
            @application.update(rejection_reason: params[:rejection_reason])
            if params[:Accepted]
                @application.update(status: "Accepted")
                @application.update(assigned_to: nil)
                ApplicationStatusMailer.application_accept(@application).deliver_later
                flash[:success] = "Application Submitted"
            else
                ApplicationStatusMailer.application_reject(@application).deliver_later
                @application.update(status: "Rejected")
                flash[:success] = "Application Rejected"
            end
            historical_data = History.new(
                'email': @application.email,
                'full_name': @application.full_name,
                'gender': @application.gender,
                'dob': @application.dob,
                'driving_license': @application.driving_license,
                'vehicle_registration_card': @application.vehicle_registration_card,
                'status': @application.status,
                'city': @application.city,
                'mobile': @application.mobile,
                'rejection_reason': @application.rejection_reason,
                'assigned_to': @application.assigned_to
            )
            historical_data.save
            redirect_to admin_home_path(params[:id])
        else
            raise ActionController::RoutingError.new('Not Found')
        end
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
