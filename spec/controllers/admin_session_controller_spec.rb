require 'rails_helper'

RSpec.describe AdminSessionController, type: :controller do
	before (:each)  do
	  	session[:admin_id]=1
	  	Admin.new('email':'admin@gmail.com','password': 'A12345', 'id': 1, 'is_verified': true).save
	end
	describe "GET #admin_login" do
	  it "returns http success with session set" do
	    get :login
	    expect(response).to redirect_to :controller => :admin, :action=> :home, :id => 1
	  end
	  it "returns http success" do
	  	session[:admin_id]=nil
	    get :login
	    expect(response).to have_http_status(:success)
	  end
	end

	describe "POST #admin_login" do
	  it "redirects to admin dashboard" do
	  	params = {
	  		'login_email': 'admin@gmail.com',
	  		'login_password': 'A12345'
	  	}
	    post :create, params: params
	    expect(response).to redirect_to :controller => :admin,:action => :home , :id =>1
	  end
	  it "redirects to login if wrong credentials" do
	  	params = {
	  		'login_email': 'admin@gmail.com',
	  		'login_password': 'A123456'
	  	}
	    post :create, params: params
	    expect(response).to redirect_to :action => :login
	  end
	end
end
