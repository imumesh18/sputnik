class UserInfo < ApplicationRecord
	validates :full_name, :presence => true
	validates :gender, :presence => true
	validates :mobile, :presence => true
	validates :dob, :presence => true
end
