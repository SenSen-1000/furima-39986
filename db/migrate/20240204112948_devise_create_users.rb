class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :nickname,           null: false
      t.string :family_name,        null: false
      t.string :first_name,         null: false
      t.string :read_family_name,   null: false
      t.string :read_first_name,    null: false
      t.date   :birth_date,         null: false
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
