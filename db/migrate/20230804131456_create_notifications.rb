class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.boolean :is_read
      t.string :message
      t.references :device, null: false, foreign_key: true

      t.timestamps
    end
  end
end
