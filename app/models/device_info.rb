class DeviceInfo < ApplicationRecord
  serialize :setting, JSON
  
  belongs_to :device
  
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "device_id", "id", "mfg_date", "mode_name", "setting", "updated_at"]
  end

   def self.ransackable_associations(auth_object = nil)
    ["device"]
  end


end
