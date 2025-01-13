class Parent < ApplicationRecord
  # Establishes a relationship indicating that each Parent belongs to a Kid
  belongs_to :kid
  
  # Establishes a relationship indicating that each Parent belongs to a User
  belongs_to :user

  # Includes the Noticed gem functionality for notifications
  has_noticed_notifications
  
  # Establishes a relationship indicating that a Parent can have many notifications
  # Notifications are polymorphic and will be destroyed if the Parent is destroyed
  has_many :notifications, as: :recipient, dependent: :destroy
end