class AddColumnsInDeviceInfo < ActiveRecord::Migration[7.0]
  def change
  		add_column :device_infos, :min_temperature, :string
  		add_column :device_infos, :max_temperature, :string
  		add_column :device_infos, :min_weight, :string
  		add_column :device_infos, :max_weight, :string
  end
end
