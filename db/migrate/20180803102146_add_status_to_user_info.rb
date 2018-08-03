class AddStatusToUserInfo < ActiveRecord::Migration[5.2]
  def change
    add_column :user_infos, :status, :string
  end
end
