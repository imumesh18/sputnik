class AddvehicleRegistrationCardToUserInfo < ActiveRecord::Migration[5.2]
  def change
    add_column :user_infos, :vehicle_registration_card, :string
  end
end
