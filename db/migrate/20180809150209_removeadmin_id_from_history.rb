class RemoveadminIdFromHistory < ActiveRecord::Migration[5.2]
  def change
    remove_column :histories, :admin_id, :integer
  end
end
