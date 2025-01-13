import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static values = { chatroomId: Number, currentUserId: Number } // Define chatroomId and currentUserId as values
  static targets = ["messages"]     // Define messages as a target

  // Called when the controller is connected to the DOM
  connect() {
    console.log(`Connecting to the chatroom with the id ${this.chatroomIdValue}.`)

    // Create a subscription to the ChatroomChannel with the chatroom ID
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },   // Channel name and chatroom ID
      { received: (data) => this.#insertMessageAndScrollDown(data) }    // Callback for when data is received
    )
    }
    // Called when the controller is disconnected from the DOM
    disconnect () {
      console.log("Disconnecting from the channel...")  // Log the disconnection message
      this.channel.unsubscribe()  // Unsubscribe from the channel
    }
    // Resets the form after a message is sent
    resetForm(event) {
      const form = event.target   // Get the form element from the event
      form.reset()
    }

    // Inserts a new message into the messages target and scrolls down
    #insertMessageAndScrollDown(data) {
      const currentUserIsSender = this.currentUserIdValue === data.sender_id    // Check if the current user is the sender
      const messageElement = this.#buildMessageElement(currentUserIsSender, data.message)   // Build the message element
      this.messagesTarget.insertAdjacentHTML("beforeend", messageElement)   // Insert the message element into the messages target
      this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)   // Scroll to the bottom of the messages target
    }

    // Builds the HTML for a message element
    #buildMessageElement(currentUserIsSender, message) {
      return `
        <div class="message-row d-flex ${this.#justifyClass(currentUserIsSender)}">
          <div class="${this.#userStyleClass(currentUserIsSender)}">
            ${message}
          </div>
        </div>
      `
    }
    // Returns the appropriate CSS class for message alignment
    #justifyClass(currentUserIsSender) {
      return currentUserIsSender ? "justify-content-end" : "justify-content-start"
    }

    #userStyleClass(currentUserIsSender) {
      return currentUserIsSender ? "sender-style" : "receiver-style";
    }
  }
