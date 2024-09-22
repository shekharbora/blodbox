class DevicePatientLog < ApplicationRecord
  belongs_to :patient
  belongs_to :device
  enum status: {unlocked: 1, locked: 0}



  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "device_id", "event", "id", "lock", "password", "patient_id", "status", "temperature", "updated_at", "weight"]
  end

  def self.feeds(devices)

  	logs = includes(:device).where(device_id: devices).order(id: :desc).limit(20)
  	chart_data = logs.group_by{|f| f.device.code}
  	temperature_data = []
  	weight_data = []
  	chart_data.each do |k,v|
  		temperature_data << {name: k,data: v.map{|f| [f.created_at.strftime("%FT%T"),f.temperature.to_f] }} 
  		weight_data << {name: k,data: v.map{|f| [f.created_at.strftime("%FT%T"),f.weight.to_f] }} 
  	end
  	return logs,temperature_data,weight_data

  end

end
