class AddassignedToToHistory < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :assigned_to, :integer
  end
end
