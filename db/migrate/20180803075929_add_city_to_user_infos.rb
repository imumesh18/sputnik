class AddCityToUserInfos < ActiveRecord::Migration[5.2]
  def change
    add_column :user_infos, :city, :string
  end
end
