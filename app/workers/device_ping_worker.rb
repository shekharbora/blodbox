require 'sneakers'
require 'sneakers/runner'
require 'open-uri'

class DevicePingWorker

  include Sneakers::Worker
  from_queue "home"

  def work(body)
  	_data = JSON.parse(body).symbolize_keys rescue {}
   	ProcessPing.new(_data).process
    ack!
  end
end
