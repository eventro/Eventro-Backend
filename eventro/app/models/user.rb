class User < ApplicationRecord
  has_secure_token :auth_token
  has_secure_password

  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  has_many :attendees, dependent: :delete_all
  has_many :event_images, dependent: :delete_all
  has_many :events, through: :attendees
  has_many :users, through: :follows



  # has_many :event, through: :comments, :likes, :attendees

  ## i think here we need to remove foreign key!!
  has_many :followees, :class_name => 'Follow'
  has_many :followers, :class_name => 'Follow'

  before_validation :downcase_email

  validates :username, :name, :email, :password, presence: true
  validates :email, :username, uniqueness: true
  validates :password, length: {minimum: 6}

  def downcase_email
    self.email = email.downcase if self.email.present?
  end
end
