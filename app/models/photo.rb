class Photo < ApplicationRecord
  # A photo can have many tags and kids through tags
  has_many :tags, dependent: :destroy
  has_many :kids, through: :tags, dependent: :destroy

  # Attach a photo file to the Photo model
  has_one_attached :photo

  # Include Noticed gem functionality for notifications
  has_noticed_notifications

  # Broadcast notifications after a photo is created
  after_create_commit { broadcast_notifications }

  private

  # Method to broadcast notifications to all users who are not teachers
  def broadcast_notifications
    User.all.each do |user|
      UserNotification.with(type: "photo").deliver(user) if user.teacher == false
    end
  end
end
