class Activity < ApplicationRecord
  belongs_to :kid # Each activity belongs to a kid
  belongs_to :user  # Each activity belongs to a user
  has_noticed_notifications # Include noticed notifications for the activity
  after_create_commit { broadcast_notifications } # Broadcast notifications after creating an activity # After the activity is created, broadcast notifications

  private

  def broadcast_notifications
    # Send a notification to the first parent of the kid
    UserNotification.with(type: "activity").deliver(self.kid.parents[0].user)
    # Send a notification to the second parent of the kid
    UserNotification.with(type: "activity").deliver(self.kid.parents[1].user)
  end
end
