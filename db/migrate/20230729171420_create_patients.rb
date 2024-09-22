class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :location
      t.string :address
      t.references :hospital, null: false, foreign_key: true
      t.references :device, null: false, foreign_key: true

      t.timestamps
    end
  end
end
