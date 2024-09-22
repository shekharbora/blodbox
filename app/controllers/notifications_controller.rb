class NotificationsController < ApplicationController
  def index
  	@notification = Notification.includes(:device).where(device_id: current_user.devices).order(id: :desc).page params[:page]
  end
end
