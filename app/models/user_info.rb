class UserInfo < ApplicationRecord
	mount_uploader :driving_license, DrivingLicenseUploader
	mount_uploader :vehicle_registration_card, VehicleRegistrationCardUploader
end
