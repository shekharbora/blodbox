class CreateDeviceRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :device_requests do |t|
      t.string :message
      t.references :device, null: false, foreign_key: true

      t.timestamps
    end
  end
end
