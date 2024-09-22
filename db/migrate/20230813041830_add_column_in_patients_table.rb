class AddColumnInPatientsTable < ActiveRecord::Migration[7.0]
  def change
  	  	add_column :patients, :age, :string
  	  	add_column :patients, :blod_group, :string  	  	  	  	
  	  	add_column :patients, :gender, :string
  	  	add_column :patients, :dob, :string
  end
end
