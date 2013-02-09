class CreateDivisions < ActiveRecord::Migration
  def change
    create_table :divisions do |t|
      t.string :name
      t.string :location_verbose
      t.float :location_geo_latitude, :default => 56.997932
      t.float :location_geo_longitude, :default => 40.983124
      t.references :division_type
      
      t.timestamps
    end
  end
end
