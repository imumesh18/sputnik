require 'rails_helper'

RSpec.describe AdminController, type: :controller do
	before (:each)  do
	  	session[:admin_id]=1
	  	Admin.new('email': 'admin@gmail.com', 'password':'A12345', 'is_verified':true, 'id':1).save
	  	UserInfo.new('email':'test@gmail.com','id':1, 'assigned_to':1, 'status': "Applied").save
	  	Admin.new('email': 'admin1@gmail.com', 'password':'A12345', 'is_verified':true, 'id':2).save
	end
	describe "GET #home" do
	  it "returns http success" do
	  	params = {
	  		'id':1
	  	}
	    get :home, params: params
	    expect(response).to have_http_status(:success)
	  end
	  it "Not logged in admin" do
	  	session[:admin_id]=nil
	  	params = {
	  		'id':1
	  	}
	    get :home, params: params
	    expect(response).to redirect_to :controller=> :admin_session, :action => :login
	  end
	end
	describe "GET #review_application" do
	  it "returns http success" do
	  	params = {
	  		'id':1,
	  		'application_id':1
	  	}
	    get :review_application, params: params
	    expect(response).to have_http_status(:success)
	  end
	  it "returns http success without session" do
	  	session[:admin_id]=2
	  	params = {
	  		'id':1,
	  		'application_id':1
	  	}
	    get :review_application, params: params
	    expect(response).to redirect_to :controller => :admin, :action=> :home, :id => 2
	  end
	end
end
