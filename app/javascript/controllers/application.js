import { Application } from "@hotwired/stimulus"
import Timeago from 'stimulus-timeago'

const application = Application.start()

application.register('timeago', Timeago)
// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

