class Announcement < ApplicationRecord
  # This sets up an association indicating that each announcement belongs to a user.
  belongs_to :user
end
