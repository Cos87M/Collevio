class ChatroomsController < ApplicationController

  def index
    # Retrieves all chatrooms that the current user is authorized to access based on Pundit policy
    @chatrooms = policy_scope(Chatroom)
  
    # Retrieves the first chatroom that the current user is authorized to access
    # This is typically used to set the first chatroom to display when the page loads
    @chatroom = policy_scope(Chatroom).first
  
    # Initializes a new Message object for creating a new message in the chatroom
    @message = Message.new
  end
  
  # def show
  #   @chatroom = policy_scope(Chatroom).first
  #   authorize @chatroom
  #   @message = Message.new
  # end
end
