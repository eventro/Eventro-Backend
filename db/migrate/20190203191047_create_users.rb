class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :auth_token
      t.string :username
      t.string :name
      t.string :date_of_birth

      t.timestamps
    end
    add_index :users, :auth_token, unique: true
  end
end
