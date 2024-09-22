class AddColumnInDeviceInfo < ActiveRecord::Migration[7.0]
  def change
  	  add_column :device_infos, :name, :string
  end
end
