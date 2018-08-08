require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

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
end
