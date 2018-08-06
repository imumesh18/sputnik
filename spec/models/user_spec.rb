require 'rails_helper'
require 'factories/user'
RSpec.describe User, type: :model do
  describe "#create" do
    it "is not valid without valid attributes" do
      expect(User.new).to_not be_valid
    end
    it "is valid with valid attributes" do
      user=build(:user)
      expect(user).to be_valid
    end
    
  end
end
