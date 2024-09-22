class MqttService

	def self.publish(channel, data )
		begin
		MQTT::Client.connect(
		  :host => ENV['MQTT_URL'],
		  :username => 'mqtt-test',
		  :password => 'mqtt-test'
		) do |client|

			 client.publish(channel, data)
			 
		end
	rescue
		Rails.logger.info "Mqtt server not able to connect "
	end

	end

end
