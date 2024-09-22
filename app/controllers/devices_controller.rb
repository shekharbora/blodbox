class DevicesController < ApplicationController

	before_action :find_device, only: [:edit,:show,:update]
	
	def index
		@device = current_user.devices.order(id: :desc).page params[:page]
	end

	def new
		@device = Device.new
	end


	def create
		
	end 

	def show

	end 

	def edit
		
	end

	def update
		@device.update(device_params)
		redirect_to devices_path
	end

	private

	def find_device
		@device = Device.find(params[:id])
	end

    def device_params
        params.require(:device).permit(:code,device_info_attributes: [:id,:mfg_date,:mode_name,:min_temperature, :max_temperature, :min_weight, :max_weight, :name ,setting: [:temperature,:weight]])
    end
end
