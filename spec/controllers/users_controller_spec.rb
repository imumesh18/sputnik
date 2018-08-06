require 'rails_helper'
require 'factories/user'

RSpec.describe UsersController, type: :controller do

    describe "for signup" do
        it 'should create a new user' do
            user=build(:user)
            create(:user)
            expect(User.count).to eq(1)
        end
    end

end
