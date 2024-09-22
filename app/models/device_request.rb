class DeviceRequest < ApplicationRecord
  belongs_to :device

  after_create :notify_dashboard

  scope :assigned, -> {where(is_assigne: true)}
  scope :not_assigned, -> {where(is_assigne: false)}

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "device_id", "id", "message", "updated_at"]
  end

 def notify_dashboard
  	channel_name = "device_request_channel_#{self.device.users.last.id}"
  	data = "new"
  	ActionCable.server.broadcast channel_name, data 
  end
  
end
