// import consumer from "./consumer"
// document.addEventListener('turbolinks:load',()=>{

//   const element = document.getElementById('user_dashboard');
//   const user_id = element.getAttribute('data-user-id');
//   consumer.subscriptions.create({channel: "FeedChannel",user_id: user_id}, {
//     connected() {
//       console.log("in connect method !!"+ user_id)
//       // Called when the subscription is ready for use on the server
//     },
  
//     disconnected() {
//       // Called when the subscription has been terminated by the server
//     },
  
//     received(data) {
//       var chart = Chartkick.charts["temperature-chart"]
//       var wChart = Chartkick.charts["weight-chart"]

//       var _data_ = chart.getData();
      
//       if (_data_[0].data.length > 20){
//           _data_[0].data.pop();        
//         }
      

//       var _data_in_channel = jQuery.parseJSON(data);
//       var w_data = wChart.getData();
//       if (w_data[0].data.length > 20){
//         w_data[0].data.pop();        
//       }
//       w_data[0].data.push([_data_in_channel.created_at,_data_in_channel.weight])
//        wChart.updateData(w_data)
       
//       _data_[0].data.push([_data_in_channel.created_at,_data_in_channel.temp])
//        chart.updateData(_data_)
      
//        add_feed(_data_in_channel);
//     }
//   });

//   function add_feed(c_data){
//      $("#device-feed").prepend('<li class="item"><div class="product-img"><img class="img-size-50" src="/packs/media/images/default-150x150-6501e3c8b2f3930950edcbc834b52add.png"></div><div class="product-info"><a href="javascript:void(0)" class="product-title">'+c_data.device_code +'<span class="badge badge-warning float-right"><span>T:</span>'+c_data.temp+'</span></a><span class="product-description">Device is<b> '+c_data.status+' </b>at  '+c_data.created_at+'<span class="badge badge-danger float-right"><span>W:</span>'+c_data.weight+'</span></span></div></li>');
    
//   }
// })



// app/javascript/channels/chatroom_channel.js
// import consumer from "./consumer"

// consumer.subscriptions.create({ channel: "FeedChannel", user_id: user_id}, {
//   connected({reconnected}) {

//     // Called when the subscription is ready for use on the server
//     console.log('connected to ChatRoom', user_id)
//     if (reconnected) {
//       console.log('reconnected to ChatRoom', user_id)
//     }
//   }
//   received(data) {
//    console.log("jdhfgjhjg");
//   }
// });



