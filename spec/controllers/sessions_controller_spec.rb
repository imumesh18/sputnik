require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before (:each)  do
      User.new('email':'user@gmail.com','password': 'A12345', 'id': 1, 'is_verified': true).save
  end
  describe "GET #login" do
    it "returns http success" do
      get :login
      expect(response).to have_http_status(:success)
    end
  end
  describe "for logged in user" do
    it 'should logout' do
      session[:user_id] = "test_user_id"
      session[:admin_id] = "test_admin_id"
      get :logout
      expect(session[:user_id]).to be_nil
      expect(session[:admin_id]).to be_nil
      expect(response).to redirect_to(root_path)
    end
  end

  describe "POST #user_login" do
    it "redirects to admin dashboard" do
      params = {
        'login_email': 'user@gmail.com',
        'login_password': 'A12345'
      }
      post :create, params: params
      expect(response).to redirect_to :controller => :user_profile,:action => :show , :id =>1
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
