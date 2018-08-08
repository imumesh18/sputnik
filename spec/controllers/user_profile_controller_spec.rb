require 'rails_helper'

RSpec.describe UserProfileController, type: :controller do
	before (:each)  do
		@GET_PARAMS ={
	  		:id => 1	  	
	  	}
	  	session[:user_id]=1
	  	User.new('email':'test@gmail.com','password':'A12345','id':1).save
	end
	describe "GET #show" do
	  it "returns http success and sets :display_profile to :home" do
	    get :show, params: @GET_PARAMS
	    expect(assigns(:display_profile)).to eq :home
	    expect(response).to have_http_status(:success)
	  end

	  it "redirects to login if session is not set" do
		session[:user_id]=nil
		get :show, params: @GET_PARAMS
		expect(response).to redirect_to :login	
	  end

	  it "redirects to user profile path if id is different from session" do
	  	CHANGED_PARAMS =  {
	  		:id => 2
	  	}
	  	get :show, params: CHANGED_PARAMS
	  	expect(response).to redirect_to :action => :show,:id => 1
	  end
	end

	describe "GET #basic_details" do
	  it "sets :display_profile to :basic_details and returns http success" do
	    get :basic_details, params: @GET_PARAMS
	    expect(assigns(:display_profile)).to eq :basic_details
	    expect(response).to have_http_status(:success)
	  end
	end

	describe "POST #basic_details_submit" do
	  it "redirects to driving license form on correct form submission" do
	  	user_info = {
	  		'full_name':"Full Name",
	  		"dob": "20/08/1996",
	  		"mobile": 9896202113, 
	  		"city": "Jakarata", 
	  		"gender": "male"
	  	}
	    post :basic_details_submit, params: {'id':1, 'user_info': user_info}
	    expect(response).to redirect_to :action => :driving_license, id:1
	  end
	  it "shows flash message on a missing field of full_name and redirects to basic_details page" do
	  	user_info = {
	  		'full_name':"",
	  		"dob": "20/08/1996",
	  		"mobile": 9896202113, 
	  		"city": "Jakarata", 
	  		"gender": "male"
	  	}
	    post :basic_details_submit, params: {'id':1, 'user_info': user_info}
	    expect(flash[:alert]).to be_present
	    expect(response).to redirect_to :action => :basic_details, id:1
	  end
	end

	describe "GET #driving_license" do
	  it "sets :display_profile to :driving_license and returns http success" do
	    get :driving_license, params: @GET_PARAMS
	    expect(assigns(:display_profile)).to eq :driving_license
	    expect(response).to have_http_status(:success)
	  end
	end
end
