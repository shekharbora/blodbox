class DashboardController < ApplicationController
	before_action :authenticate_user!

  def index
  	@user_devices   = current_user.devices
  	@decive_count = @user_devices.count
  	@device_status = [['online',@decive_count],['offline',0]]

  	@notification = Notification.where(device_id: @user_devices).count
  	@device_request = DeviceRequest.not_assigned.where(device_id: @user_devices).count

  	@feed,@tmp,@weight = DevicePatientLog.feeds(@user_devices)
  end
end
