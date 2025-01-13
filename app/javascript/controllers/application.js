import { Application } from "@hotwired/stimulus"

// Initializes a new Stimulus application instance
const application = Application.start()

// Configure Stimulus development experience
// Attach the Stimulus application instance to the global `window` object
// This allows to interact with Stimulus directly in the browser console (useful for debugging)
application.debug = false
window.Stimulus   = application

export { application }
