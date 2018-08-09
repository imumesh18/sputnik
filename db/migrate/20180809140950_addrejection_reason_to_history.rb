class AddrejectionReasonToHistory < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :rejection_reason, :string
  end
end
