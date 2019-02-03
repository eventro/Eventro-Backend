class ChangeTypesForUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :date_of_birth, :string

  end
end
