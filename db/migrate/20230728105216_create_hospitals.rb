class CreateHospitals < ActiveRecord::Migration[7.0]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :location
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
