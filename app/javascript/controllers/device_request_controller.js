import { Controller } from "@hotwired/stimulus"
import consumer from "channels/consumer"

// Connects to data-controller="device-request"
export default class extends Controller {
  connect() {
  	console.log("i am in !!=====");
  	const element = document.getElementById('user_dashboard');
    const userId = element.getAttribute('data-user-id');
  	this.sub = this.createActionCableChannel(userId, this.element);
  }

  createActionCableChannel(userId,element){
	return consumer.subscriptions.create({channel: "DeviceRequestChannel",user_id: userId}, {
	  connected() {
		
	  	console.log("! am connected !!! with DeviceRequest channel");
	  	
	    // Called when the subscription is ready for use on the server
	  },

	  disconnected() {
	    // Called when the subscription has been terminated by the server
	  },

	  received(data) {
	  	const element = document.querySelector('.request-count');
		let count = parseInt(element.innerText)
	    element.innerText = `${count+1}`
	  }
	});
  }
}
