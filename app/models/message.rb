class Message < ApplicationRecord
  # A message belongs to a chatroom and a user
  belongs_to :chatroom
  belongs_to :user

  # Include Noticed gem functionality for notifications
  has_noticed_notifications

  # Broadcast notifications after a message is created
  after_create_commit { broadcast_notifications }

  # Method to check if the message sender is the given user
  def sender?(a_user)
    user.id == a_user.id
  end

  private

  # Method to broadcast notifications based on the user type
  def broadcast_notifications
    if user.teacher
      UserNotification.with(type: "message").deliver(self.chatroom.kid.parents[0].user)
      UserNotification.with(type: "message").deliver(self.chatroom.kid.parents[1].user)
    else
      UserNotification.with(type: "message").deliver(self.chatroom.kid.rooms[0].user)
    end
  end
end
