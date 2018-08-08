class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :email
      t.string :encrypted_password
      t.boolean :is_verified
      t.string :token
      t.string :salt

      t.timestamps
    end
  end
end
