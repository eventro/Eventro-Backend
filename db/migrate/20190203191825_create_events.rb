class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.string :start_date
      t.string :end_date
      t.string :location
      t.string :location_id
      t.string :logo
      t.references :organizer, foreign_key: true

      t.timestamps
    end
  end
end
