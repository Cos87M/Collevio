class Notification < ApplicationRecord
  # Include Noticed gem functionality for notifications
  include Noticed::Model

  # Establishes a polymorphic relationship indicating that a Notification belongs to a recipient
  belongs_to :recipient, polymorphic: true
end
