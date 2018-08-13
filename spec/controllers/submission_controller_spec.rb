require 'rails_helper'

	RSpec.describe SubmissionController, type: :controller do
	before (:each)  do
	  	session[:admin_id]=1
	  	Admin.new('email':'admin@gmail.com', 'id':1, 'password':'A12345').save
	  	UserInfo.new('email':'test@gmail.com','id':1, 'assigned_to':1, 'status': "Applied").save
	end

	describe "POST update_status" do
		it "Should redirect to admin on correct submission" do
			param = {
				"rejection_reason": "Test_Reason",
				"Accepted": true,
				"application_id": 1,
				"id": 1
			}
			post :update_status, params: param
			expect(response).to redirect_to :controller => :admin,:action => :home, :id=>1
		end

		it "Should redirect to admin on incorrect submission" do
			param = {
				"rejection_reason": "Test_Reason",
				"application_id": 1,
				"id": 1
			}
			post :update_status, params: param
			expect(response).to redirect_to :controller => :admin,:action => :home, :id=>1
		end
	end
end
