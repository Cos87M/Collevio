class MessagesController < ApplicationController
  # Creates a new message and broadcasts it to the chatroom
  def create
    # Finds the chatroom using the provided `chatroom_id` from the URL parameters
    @chatroom = Chatroom.find(params[:chatroom_id])

    # Initializes a new Message object using the submitted message parameters
    @message = Message.new(message_params)

    # Authorizes the action using Pundit to ensure the user has permission to create a message
    authorize @message

    # Associates the new message with the selected chatroom and the current user
    @message.chatroom = @chatroom
    @message.user = current_user

    # Saves the message to the database
    @message.save

    # Broadcasts the newly created message to the chatroom in real time using ActionCable
    ChatroomChannel.broadcast_to(
      @chatroom, # Target the specific chatroom
      message: render_to_string(partial: "message", locals: { message: @message }),  # Renders the message partial as a string
      sender_id: @message.user.id  # Sends the ID of the user who sent the message
    )
    # Responds with HTTP status 200 (OK) without rendering a view or redirecting
    # This is to confirm the message was sent successfully without needing to reload or redirect the page
    head :ok # don't send a view, don't make them redirect
  end

  private
  # Defines the allowed parameters for creating a message
  # Only `:content` is permitted to prevent mass assignment vulnerabilities
  def message_params
    params.require(:message).permit(:content)
  end
end
