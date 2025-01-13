class Meeting < ApplicationRecord
  # A meeting belongs to a user
  belongs_to :user

  # Validations to ensure presence of start_time and end_time
  # and that end_time is greater than start_time
  validates :start_time, :end_time, presence: true
  validates :end_time, comparison: { greater_than: :start_time }

  # Include Noticed gem functionality for notifications
  has_noticed_notifications

  # Broadcast notifications after a meeting is created
  after_create_commit { broadcast_notifications }

  private

  # Method to broadcast notifications to all users who are not teachers
  def broadcast_notifications
    User.all.each do |user|
      UserNotification.with(type: "meeting").deliver(user) if user.teacher == false
    end
  end
end
