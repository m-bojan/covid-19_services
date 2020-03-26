class CreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|
      t.string  :name, null: false
      t.string  :username, unique: true, null: false
      t.string  :password_digest
      t.integer :role, null: false, default: 1
      t.integer :status, null: false, default: 1

      t.string :email
      t.timestamps
    end
  end
end
