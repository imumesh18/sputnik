class AddDrivingLicenseToUserInfo < ActiveRecord::Migration[5.2]
  def change
    add_column :user_infos, :driving_license, :string
  end
end
