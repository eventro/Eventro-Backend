class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :name, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :status, :string
  end
end
