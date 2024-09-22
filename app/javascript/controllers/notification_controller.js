import { Controller } from "@hotwired/stimulus"
import consumer from "channels/consumer" 	
// Connects to data-controller="notification"
export default class extends Controller {
  connect() {
  	console.log("i am in !!");
  	const element = document.getElementById('user_dashboard');
    const userId = element.getAttribute('data-user-id');
  	this.sub = this.createActionCableChannel(userId, this.element);
  }

  createActionCableChannel(userId,element){
	return consumer.subscriptions.create({channel: "NotificationChannel",user_id: userId}, {
	  connected() {
		
	  	console.log("! am connected !!! with notification channel");
	  	
	    // Called when the subscription is ready for use on the server
	  },

	  disconnected() {
	    // Called when the subscription has been terminated by the server
	  },

	  received(data) {
	  	const element = document.querySelector('.notification-count');
	  	const element2 = document.querySelector('.notification-count-nav');
		let count = parseInt(element.innerText)
	    element.innerText = `${count+1}`
	    element2.innerText = `${count+1}`
	  }
	});
  }
}
