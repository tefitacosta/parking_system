class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.float :location_latitud
      t.float :location_longitude
      t.string :description

      t.timestamps null: false
    end
  end
end
