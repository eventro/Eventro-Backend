class Organizer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :events, dependent: :delete_all
  acts_as_token_authenticatable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
