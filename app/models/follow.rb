class Follow < ApplicationRecord
  # has_many :followee, :class_name => "User"
  # has_many :follower, :class_name => "User"
  validates :follower_id, uniqueness: {scope: :followee_id,
    message: "Already Following"}
  belongs_to :followee, :class_name => "User", foreign_key: 'followee_id'
  belongs_to :follower, :class_name => "User", foreign_key: 'follower_id'
end
