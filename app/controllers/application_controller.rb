class ApplicationController < ActionController::Base

	def nofification
		@notification = Notification.where(device_id: current_user.devices).count
	end
end
