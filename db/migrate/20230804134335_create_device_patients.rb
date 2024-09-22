class CreateDevicePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :device_patients do |t|
      t.integer :status
      t.references :device, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
