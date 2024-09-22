import consumer from "./consumer"
document.addEventListener('turbolinks:load',()=>{

  const element = document.getElementById('user_dashboard');
  const user_id = element.getAttribute('data-user-id');
  consumer.subscriptions.create({channel: "PingRoomChannel",user_id: user_id}, {
    connected() {
      console.log("in connect method !!"+ user_id)
      // Called when the subscription is ready for use on the server
    },
  
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
  
    received(data) {
      console.log(data);
      $("#address").html(data.address);
      $("#device_code").html(data.device_code);
      $("#location").html(data.location);
      $("#hospital_id").html(data.hospital_id);
      $("#hospital_name").html(data.hospital_name);
      $("#patient_form").attr("href", "/patients/"+data.id+"/edit")
      $('#exampleModal').modal("show");

      var chart = Chartkick.charts["temperature-chart"]
      var _data_ = chart.getData(); 
      console.log(chart);
      // if (_data_[i].data.length > 20){
      //     _data_[i].data.pop();        
      //   }
      //   _data_[i].data.push([data.data.created_at,value.res_value])
      // chart.updateData(_data_)

      // Called when there's incoming data on the websocket for this channel
    }
  });
})

