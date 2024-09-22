module DashboardHelper

	# def temperature_data
	# 	binding.pry
	# 	_data = @feed.group_by{|f| f.device.code}
	# 	_data.map|_k,_v|
	# 		device_code = _k
	# 		{name: device_code,data: v.map{|f| [f[2].strftime("%FT%T"),f[0].to_f] }}

	# 	end
 #    @feed.map do |k, v| 
 #      device_code = @devices.select{|f| f if f.id == 1}
 #      {name: "#{device_code.last.code}",data: v.map{|f| [f[2].strftime("%FT%T"),f[0].to_f] }}
 #    end
 #  end

 #  def weight_data
 #    @feed.map do |k, v| 
 #      device_code = @devices.select{|f| f if f.id == 1}
 #      {name: "#{device_code.last.code}",data: v.map{|f| [f[2].strftime("%FT%T"),f[1].to_f] }}
 #    end
 #  end

end
