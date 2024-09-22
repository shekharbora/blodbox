class CreateDevices < ActiveRecord::Migration[7.0]
  def change
    create_table :devices do |t|
      t.string :code, index: true
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
