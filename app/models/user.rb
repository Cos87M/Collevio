class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # A user can have many announcements, rooms, and activities
  has_many :announcements, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :activities, dependent: :destroy

  # A user can have many messages and chatrooms through messages
  has_many :messages, dependent: :destroy
  has_many :chatrooms, through: :messages, dependent: :destroy

  # A user can have many parents
  has_many :parents, dependent: :destroy

  # A user can have many kids through rooms and many children through parents
  has_many :kids, through: :rooms, dependent: :destroy
  has_many :children, through: :parents, source: :kid, dependent: :destroy
  has_many :chatrooms, through: :children, dependent: :destroy
  # is it possible to do through x2?

  # A user can have many notifications as a recipient
  has_many :notifications, as: :recipient, dependent: :destroy

  # Devise modules for authentication
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

# has_many :bookmarked_posts, through: :bookmarks, source: :post
# user.chatrooms yay!
