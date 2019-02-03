class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :cups, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  has_many :attendees, dependent: :delete_all

  acts_as_token_authenticatable

  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
