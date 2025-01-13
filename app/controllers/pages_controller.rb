class PagesController < ApplicationController
  # Skips user authentication for the `home` action
  # All other actions require the user to be logged in
  skip_before_action :authenticate_user!, only: :home

  # The public-facing home page
  def home
  end

  # The user's dashboard page
  def dashboard
    # Fetches all photos and meetings to display on the dashboard
    @photos = Photo.all
    @meetings = Meeting.all

     # Check if the current user is a parent (not a teacher)
    if current_user.teacher == false
      # Retrieves the children associated with the current parent user
      @kids = current_user.children
      # Fetches the first child's chatroom (hardcoded to work with Max's chatroom)
      # Assumes each child has chatroom IDs associated with them
      @chatrooom = Chatroom.find(@kids.first.chatroom_ids.join.to_i)
    else
      # Retrieves the kids associated with the current teacher user
      @kids = current_user.kids
      # Fetches the first kid's chatroom (hardcoded to work with Max's chatroom)
      @chatrooom = Chatroom.find(@kids.first.chatroom_ids.join.to_i)
    end
    # Fetches all notifications for the current user
    @notifications = current_user.notifications

    # Uncomment this line if you want to mark notifications as read when viewing the dashboard
    # current_user.notifications.mark_as_read!
  end
end
