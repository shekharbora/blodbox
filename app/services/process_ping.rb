class ProcessPing

  def initialize(params)
    @params = params.as_json
    @device = find_device(@params["device_id"])
  end

  def process
    Rails.logger.info "Processing event: #{@params['event']} with params: #{@params.inspect}"
    if respond_to?(@params["event"].to_sym, true)
      send(@params["event"].to_sym)
    else
      Rails.logger.error "Unsupported event: #{@params['event']}"
    end
  end

  private

  def assign
    device_patient = @device&.device_patients&.last
    unless device_patient&.inprogress?
      DeviceRequest.create(device_id: @device.id, message: "Device Request to Add Patient!")
    end
  end

  def complete
    inprogress_patients = @device.device_patients.where(status: 'inprogress')
    inprogress_patients.update_all(status: 'complete')
  end

  def feed
    Rails.logger.info "Handling box_feed event for device: #{@device&.as_json}"

    if @device.present? && @device.device_patients.inprogress.exists?
      Rails.logger.info "Log created for in-progress patients."
      feed_data = bake_data
      if @params["patient_id"].present?
        device_log = DevicePatientLog.create(feed_data)
        send_msg("feed_channel_#{@device&.users&.last&.id}", feed_data.merge(format_feed_data(device_log)))
        notify(feed_data)
      end
    else
      Rails.logger.info "No in-progress patients found for the feed event."
    end
  end

  def find_device(code)
    Device.find_by_code(code)
  end

  def send_msg(channel_name, data)
    ActionCable.server.broadcast(channel_name, data)
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
  end

  def format_feed_data(device_log)
    {
      device_code: @device.code,
      patient_name: @device.patients&.last&.name,
      created_at: device_log.created_at.strftime("%FT%T")
    }
  end

  def notify(feed_data)
    check_threshold(:temperature, feed_data[:temperature], @device&.device_info&.max_temperature.to_f, "Temperature")
    check_threshold(:weight, feed_data[:weight], @device&.device_info&.max_weight.to_f, "Weight")
  end

  def check_threshold(type, value, threshold, name)
    return unless value.to_f > threshold

    Notification.create(message: "#{name} exceeded the higher threshold!", device_id: @device.id)
  end

end
