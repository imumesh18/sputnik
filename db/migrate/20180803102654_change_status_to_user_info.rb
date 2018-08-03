class ChangeStatusToUserInfo < ActiveRecord::Migration[5.2]
  def change
  	change_column :user_infos, :status, :string, :default => "Not Applied"
  end
end
