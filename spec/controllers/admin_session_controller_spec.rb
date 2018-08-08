require 'rails_helper'

RSpec.describe AdminSessionController, type: :controller do
	describe "GET #admin_login" do
	  it "returns http success" do
	    get :login
	    expect(response).to have_http_status(:success)
	  end
	end
end
