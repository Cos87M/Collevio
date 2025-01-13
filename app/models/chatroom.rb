class Chatroom < ApplicationRecord
  # Relationship indicating that each chatroom belongs to a single kid
  belongs_to :kid
  
  # Establishes a one-to-many relationship with messages, and ensures that all associated messages are destroyed if the chatroom is destroyed
  has_many :messages, dependent: :destroy
end
