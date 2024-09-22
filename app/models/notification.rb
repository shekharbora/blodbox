class Notification < ApplicationRecord
  belongs_to :device

  after_create :notifiy_frontend

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "device_id", "id", "is_read", "message", "updated_at"]
  end



  def notifiy_frontend
  	channel_name = "notification_channel_#{self.device.users.last.id}"
  	data = "new"
  	ActionCable.server.broadcast channel_name, data 
  end
  
end
