
// Expose action cable
import * as ActionCable from '@rails/actioncable'
window.App || (window.App = {});
window.App.cable = ActionCable.createConsumer();
import "channels/notification_channel"
// Import all the channels to be used by Action Cable
import "channels/feed_channel"
import "channels/device_request_channel"
