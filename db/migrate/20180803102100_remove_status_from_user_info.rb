class RemoveStatusFromUserInfo < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_infos, :status, :integer
  end
end
