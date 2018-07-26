class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :encrypted_password 
      t.string :salt
      t.string :token
      t.boolean :is_verified
      t.timestamps
    end
  end
end
