require 'rails_helper'
require 'factories/user'
require 'json'

RSpec.describe UsersController, type: :controller do
    describe "for signup" do
        it 'should create a new user' do
            user_signup_data=File.read("./data/signup_data.json")
            user_signup_data=JSON.parse(user_signup_data)
            user = {
                user: user_signup_data
            }
            post :create, params: user
            expect(User.count).to eq(1)
            expect(response).to redirect_to(signup_url)
        end
    end
    
    describe "for verify" do
        it 'should verify token' do
            user_signup_data=File.read("./data/signup_data.json")
            user_signup_data=JSON.parse(user_signup_data)
            user = {
                user: user_signup_data
            }
            post :create, params: user
            user=User.find_by(email: "test@gmail.com")
            get :verify, params: {:token => user.token }
            user=User.find_by(email: "test@gmail.com")
            expect(user.is_verified).to be_equal(true)
            expect(response).to redirect_to(login_url)
        end
        it 'should not verify token' do
            user_signup_data=File.read("./data/signup_data.json")
            user_signup_data=JSON.parse(user_signup_data)
            user = {
                user: user_signup_data
            }
            post :create, params: user
            user=User.find_by(email: "test@gmail.com")
            user.update_attribute('is_verified', true)
            get :verify, params: {:token => user.token }
            expect(response).to redirect_to(login_url)
        end
    end

end
