class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :cups, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  has_many :attendees, dependent: :delete_all

  has_many :followees, :class_name => 'Follow', :foreign_key => 'followee_id'
  has_many :followers, :class_name => 'Follow', :foreign_key => 'follower_id'

  acts_as_token_authenticatable

  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
