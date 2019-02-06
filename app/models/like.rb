class Like < ApplicationRecord
  validates :user_id, uniqueness: {scope: :event,
                                   message: "Already Liked"}
  belongs_to :user
  belongs_to :event
end
