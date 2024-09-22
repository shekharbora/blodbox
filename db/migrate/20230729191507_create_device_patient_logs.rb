class CreateDevicePatientLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :device_patient_logs do |t|
      t.integer :event
      t.string :password
      t.decimal :temperature
      t.decimal :wight
      t.integer :lock
      t.integer :status
      t.references :patient, null: false, foreign_key: true
      t.references :device, null: false, foreign_key: true

      t.timestamps
    end
  end
end
