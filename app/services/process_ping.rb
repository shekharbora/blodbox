class ProcessPing

	def initialize(params)
		@params = params.as_json
		@device = find_device @params["device_id"]
	end

	def process
		Rails.logger.info "========= #{@params} ========="
		send(@params["event"].to_sym)
	end

	def assign
		unless @device&.device_patients&.last&.inprogress?
			DeviceRequest.create(device_id: @device.id, message: "Device Request to Add Patient!")
		end
	end

	def complete
		_dp = @device.device_patients.where(status: 'inprogress')
		_dp.each{|dp| dp.update(status: 'complete')}
	end

	def feed
		Rails.logger.info "========= box_feed event #{@device.as_json} ==========="	
		
		if @device.present? && @device.device_patients.inprogress.present?
			Rails.logger.info "====log created====="
			_feed = bake_data
			_dl = DevicePatientLog.create(_feed) if @params["patient_id"].present?
			send_msg("feed_channel_#{@device&.users&.last&.id}",_feed.merge(feed_data(_dl)))
			notify _feed
		end
	end

	def find_device code
		Device.find_by_code code
	end

	def send_msg(channel_name,data)
    ActionCable.server.broadcast channel_name, data    
  end

  def bake_data
  	{
    	device_id: @device.id,
	    patient_id: @params["patient_id"],
	    event: @params["event"],
	    temperature: @params["temp"],
	    weight: @params["weight"],
	    lock: @params["lock_type"],
	    status: @params["lock_status"]
  	}
  	#password: @params["password"],
  end

  def feed_data(_dl)
  	{
  		device_code: @device.code,
  		patient_name: @device.patients&.last&.name,
  		created_at: _dl.created_at.strftime("%FT%T")
  	}
  end


  def notify _feed
  	temperature_threshold = @device&.device_info&.max_temperature.to_f
    weight_threshold = @device&.device_info&.max_weight.to_f

    if _feed[:temperature].to_f > temperature_threshold 
    	Notification.create(message: "Temperature exceeded the higher threshold.!! ", device_id: @device.id)
    end
    if _feed[:weight].to_f > weight_threshold 
    	Notification.create(message: "Weight exceeded the higher threshold.!! ", device_id: @device.id)
    end
  end


end
