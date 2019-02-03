class AddAuthenticationTokenToOrganizers < ActiveRecord::Migration[5.2]
  def change
    add_column :organizers, :authentication_token, :string, limit: 30
    add_index :organizers, :authentication_token, unique: true
  end
end
