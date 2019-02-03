class AddColumnsToOrganizer < ActiveRecord::Migration[5.2]
  def change
    add_column :organizers, :name, :string
    add_column :organizers, :phone, :string
  end
end
