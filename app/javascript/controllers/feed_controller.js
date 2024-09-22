import { Controller } from "@hotwired/stimulus"
import consumer from "channels/consumer"

// Connects to data-controller="feed"
export default class extends Controller {
  connect() {
  	console.log("i am in !!");
  	const element = document.getElementById('user_dashboard');
    const userId = element.getAttribute('data-user-id');
  	this.sub = this.createActionCableChannel(userId);
  }

  createActionCableChannel(userId){
	return consumer.subscriptions.create({channel: "FeedChannel",user_id: userId}, {
	  connected() {
	  	console.log("! am connected !!!")
	    // Called when the subscription is ready for use on the server
	  },

	  disconnected() {
	    // Called when the subscription has been terminated by the server
	  },

	  received(data) {
	  	console.log("received !!!")
      console.log(data)
	  	const element = document.querySelector(".device-feed-box")
    	element.insertAdjacentHTML("afterbegin", this.newHtml(data));
    	this.updateChartData(data)

	  },
	  newHtml(data){
	  	 return`<div class="mb-2 mt-2 list-group w-auto">
          <a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
            <svg class="align-text-right fa-2x text-gray-300" aria-label="Your Devices" role="img" fill="none" stroke="currentColor" viewBox="0 0 24 24" version="1.1" width="30" height="30" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="4" y="4" width="16" height="16" rx="2" ry="2"></rect><rect x="9" y="9" width="6" height="6"></rect><line x1="9" y1="1" x2="9" y2="4"></line><line x1="15" y1="1" x2="15" y2="4"></line><line x1="9" y1="20" x2="9" y2="23"></line><line x1="15" y1="20" x2="15" y2="23"></line><line x1="20" y1="9" x2="23" y2="9"></line><line x1="20" y1="14" x2="23" y2="14"></line><line x1="1" y1="9" x2="4" y2="9"></line><line x1="1" y1="14" x2="4" y2="14"></line></svg>
            <div class="d-flex gap-2 w-100 justify-content-between">
              <div>
                <h6 class="mb-0">****${data["device_code"].slice(-4)}</h6>
                <p class="mb-0 opacity-75"> Device is <b>${data["status"]}</b></p>
              </div>
              <div>
                  <p><svg class="align-text-right fa-2x text-gray-300" aria-hidden="true" fill="none" stroke="currentColor" viewBox="0 0 24 24" version="1.1" width="20" height="20" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M14 14.76V3.5a2.5 2.5 0 0 0-5 0v11.26a4.5 4.5 0 1 0 5 0z"></path></svg>
                  <span>${data["temperature"]}</span>  | 
                  <svg class="align-text-right fa-2x text-gray-300" aria-hidden="true" fill="none" stroke="currentColor" viewBox="0 0 24 24" version="1.1" width="20" height="20" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="16.5" y1="9.4" x2="7.5" y2="4.21"></line><path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"></path><polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline><line x1="12" y1="22.08" x2="12" y2="12"></line></svg>
                  <span>${data["weight"]}g</span></p>
                </div>
              <small class="opacity-50 text-nowrap">
              	  <time data-controller="timeago" data-timeago-datetime-value=${data["created_at"]}></time>
              </small>
            </div>
          </a>
        </div>`
	  },
	  updateChartData(data){
		  var chart = Chartkick.charts["temperature-chart"]
      var wChart = Chartkick.charts["weight-chart"]
      console.log(chart)
	  	var _data_ = chart.getData();
      if (_data_[0].data.length > 20){
          _data_[0].data.pop();        
        }
      // var _data_in_channel = jQuery.parseJSON(data);
      var w_data = wChart.getData();
      if (w_data[0].data.length > 20){
        w_data[0].data.pop();        
      }
      w_data[0].data.push([data["created_at"],data["weight"]])
       wChart.updateData(w_data)
       
      _data_[0].data.push([data["created_at"],data["temperature"]])
      chart.updateData(_data_)
	  }
	});
  }

}
