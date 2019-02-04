class Follow < ApplicationRecord
  # has_many :followee, :class_name => "User"
  # has_many :follower, :class_name => "User"
  belongs_to :followee, :class_name => "User"
  belongs_to :follower, :class_name => "User"
end
