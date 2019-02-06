class CreateEventImages < ActiveRecord::Migration[5.2]
  def change
    create_table :event_images do |t|
      t.string :image
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
