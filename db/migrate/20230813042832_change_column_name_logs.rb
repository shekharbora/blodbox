class ChangeColumnNameLogs < ActiveRecord::Migration[7.0]
  def change
  	 rename_column(:device_patient_logs, :wight, :weight)
  end
end
