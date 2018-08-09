class AddrejectionReasonToUserInfo < ActiveRecord::Migration[5.2]
  def change
    add_column :user_infos, :rejection_reason, :string
  end
end
