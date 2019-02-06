class Attendee < ApplicationRecord
  validates :user_id, uniqueness: {scope: :event,
                                   message: "Already attending"}
  belongs_to :user
  belongs_to :event
end
