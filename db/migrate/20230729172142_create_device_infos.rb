class CreateDeviceInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :device_infos do |t|
      t.date :mfg_date
      t.string :mode_name
      t.string :setting
      t.references :device, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
