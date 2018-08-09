class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.string :email
      t.string :full_name
      t.string :gender
      t.date :dob
      t.string :driving_license
      t.string :vehicle_registration_card
      t.string :reason
      t.string :status
      t.string :city
      t.integer :admin_id
      t.integer :mobile, :limit => 8 
      t.timestamps
    end
  end
end
