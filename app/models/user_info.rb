class UserInfo < ApplicationRecord
	validates :full_name, :presence => true
	validates :gender, :presence => true
	validates :mobile, :presence => true
	validates :dob, :presence => true
	mount_uploader :driving_license, DrivingLicenseUploader
	mount_uploader :vehicle_registration_card, VehicleRegistrationCardUploader
end
