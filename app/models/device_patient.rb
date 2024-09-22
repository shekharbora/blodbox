class DevicePatient < ApplicationRecord
  belongs_to :device
  belongs_to :patient

  enum status: {inprogress: 0, complete: 1}

  after_save :update_device_request
 
  after_create :send_back_to_device

  scope :complete,->{where(status: "complete")}
  scope :inprogress,->{where(status: "inprogress")}
  

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "device_id", "id", "patient_id", "status", "updated_at"]
  end


  def update_device_request
  	msg = ""
  	if self.inprogress?
  		msg = "Device is assigned and started it's journey!"
  		#update device request to start 
  	else self.complete?
		msg = "Device completed it's task or journey!"
  	end
	create_notification msg
  end

  def create_notification msg
    Rails.logger.info "sdkjfhdfjhgjdfh"
  	Notification.create(message: msg, device_id: device_id, is_read: false)
  end


  def send_back_to_device
  	channel_name =  "dev/#{self.device.code}/sub"
    MqttService.publish(channel_name, bake_data_payload)
  end

  def bake_data_payload
    p = self.patient
      {"id"=>p.id.to_s,
     "name"=>p.name,
     "location"=>p.location,
     "address"=>p.address,
     "hospital_id"=>p.hospital_id.to_s,
     "device_id"=>p.device_id.to_s,
     "age"=>p.age,
     "blood_group"=>p.blood_group,
     "gender"=>p.gender,
     "dob"=>p.dob}.to_json
  end

end
