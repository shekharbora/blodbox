class DeviceRequestsController < ApplicationController

	def index
		@requests = DeviceRequest.where(device_id: current_user.devices).order(id: :desc).page params[:page]
	end

end
