class UserInfo < ApplicationRecord
	mount_uploader :driving_license, DrivingLicenseUploader
end
