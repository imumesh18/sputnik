class RemovereasonFromHistory < ActiveRecord::Migration[5.2]
  def change
    remove_column :histories, :reason, :string
  end
end
