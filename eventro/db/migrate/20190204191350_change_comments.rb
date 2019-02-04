class ChangeComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :comment, :string
    add_column :comments, :message, :string
  end
end
