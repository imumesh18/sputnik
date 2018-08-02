class CreateUserInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :user_infos do |t|
      t.string :email
      t.string :full_name
      t.string :gender
      t.date :dob
      t.integer :mobile, :limit => 8 
      t.timestamps
    end
  end
end
