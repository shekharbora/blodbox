class FeedsController < ApplicationController
  def index
  	@feed = DevicePatientLog.includes(:device).where(device_id: current_user.devices).order(id: :desc).page params[:page]
  end

  def device_logs
	@feed = DevicePatientLog.includes(:device).where(device_id: current_user.devices).order(id: :desc).limit(30)
  end
end
