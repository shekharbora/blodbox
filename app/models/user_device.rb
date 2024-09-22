class UserDevice < ApplicationRecord
  belongs_to :user
  belongs_to :device
  
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "device_id", "id", "updated_at", "user_id"]
  end
  
end
