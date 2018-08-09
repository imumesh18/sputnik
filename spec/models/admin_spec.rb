require 'rails_helper'

RSpec.describe Admin, type: :model do
  subject {
    described_class.new(email: "abhinav@gmail.com", password: "A12345")
  }
  describe "#create" do
    it "is valid with valid attributes" do
    	expect(subject).to be_valid
  	end
    it "is not valid without a email" do
    	subject.email = nil
    	expect(subject).to_not be_valid
  	end
  	it "is not valid without a password" do
    	subject.password = nil
    	expect(subject).to_not be_valid
  	end
  	it "is not valid without a password less than 6" do
    	subject.password = "123"
    	expect(subject).to_not be_valid
  	end
  	it "is not valid without a password not including a number" do
    	subject.password = "ABCDEFG"
    	expect(subject).to_not be_valid
  	end
  	it "is not valid without a password not including a Character" do
    	subject.password = "123456"
    	expect(subject).to_not be_valid
  	end
  	it "is not valid without a password not including a Character" do
    	subject.password = "123456"
    	expect(subject).to_not be_valid
  	end
  end

  describe "#clear_password" do
  	it "should be cleared after calling clear_password method" do
  		subject.clear_password
  		expect(subject.password).to eq(nil)
  	end
  end

  describe "#email_verified" do
  	it "should return email_verified" do
  		subject.is_verified = false
  		expect(subject.email_verified?).to eq(false) 
  	end
  end

  describe "#match_password" do
  	it "should verify login password A12345 with encrypted_password for A12345" do
  		subject.encrypted_password = "$2a$10$2cL6GuSCYcYeyEdPxO7t1ew/D80pXMPOBdp6AhvnwL0MnIHj1U/f."
  		subject.salt = "$2a$10$2cL6GuSCYcYeyEdPxO7t1e"
  		expect(subject.match_password("A12345")).to eq(true)
  	end
  end

end
