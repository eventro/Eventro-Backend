class CreateOrganizers < ActiveRecord::Migration[5.2]
  def change
    create_table :organizers do |t|
      t.string :email
      t.string :password_digest
      t.string :auth_token
      t.string :name
      t.string :phone

      t.timestamps
    end
    add_index :organizers, :auth_token, unique: true
  end
end
