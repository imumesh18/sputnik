class AddAssignedToToUserInfo < ActiveRecord::Migration[5.2]
  def change
    add_column :user_infos, :assigned_to, :integer
  end
end
