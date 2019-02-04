class AddUserToEventImages < ActiveRecord::Migration[5.2]
  def change
    add_reference :event_images, :user, index: true
  end
end
