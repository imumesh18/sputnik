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

	describe "POST #driving_license_submit" do
	  it "redirects to vehicle_registration_card form on correct form submission" do
	  	user_info = {
	  		'driving_license': 'https://robohash.org/sitsequiquia.png?size=300x300'
	  	}
	    post :driving_license_submit, params: {'id':1, 'user_info': user_info}
	    expect(response).to redirect_to :action => :vehicle_registration_card, id:1
	  end
	end

	describe "GET #vehicle_registration_card" do
	  it "sets :display_profile to :vehicle_registration_card and returns http success" do
	    get :vehicle_registration_card, params: @GET_PARAMS
	    expect(assigns(:display_profile)).to eq :vehicle_registration_card
	    expect(response).to have_http_status(:success)
	  end
	end

	describe "POST #vehicle_registration_card_submit" do
	  it "redirects to vehicle_registration_card form on correct form submission" do
	  	user_info = {
	  		'vehicle_registration_card': 'https://robohash.org/sitsequiquia.png?size=300x300'
	  	}
	    post :vehicle_registration_card_submit, params: {'id':1, 'user_info': user_info}
	    expect(response).to redirect_to :action => :application_preview, id:1
	  end
	end

	describe "GET #application_preview" do
	  it "sets :display_profile to :application_preview and returns http success" do
	    get :application_preview, params: @GET_PARAMS
	    expect(assigns(:display_profile)).to eq :application_preview
	    expect(response).to have_http_status(:success)
	  end
	end

	describe "POST #apply" do
	  it "redirects to user_profile on correct form submission" do
	  	user_info = {
	  		'full_name':"Test",
	  		"dob": "20/08/1996",
	  		"mobile": 9896202113, 
	  		"city": "Jakarata", 
	  		"gender": "male"
	  	}
	    post :apply, params: {'id':1, 'user_info': user_info}
	    expect(response).to redirect_to :action => :show, id:1
	  end
	end
end
