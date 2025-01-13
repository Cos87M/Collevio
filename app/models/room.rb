class Room < ApplicationRecord
  # A room belongs to a user and a kid
  belongs_to :user
  belongs_to :kid
end
