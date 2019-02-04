class Event < ApplicationRecord
  belongs_to :organizer
  has_many :event_images, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  has_many :attendees, dependent: :delete_all
  # has_many :user, through: :comments, :likes, :attendees

end
