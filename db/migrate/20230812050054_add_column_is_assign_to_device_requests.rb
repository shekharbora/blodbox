class AddColumnIsAssignToDeviceRequests < ActiveRecord::Migration[7.0]
  def change
  	add_column :device_requests, :is_assigne, :boolean, default: false
  end
end
