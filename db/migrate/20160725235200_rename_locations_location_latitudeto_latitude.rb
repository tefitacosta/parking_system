class RenameLocationsLocationLatitudetoLatitude < ActiveRecord::Migration
  def change
    rename_column :locations, :location_latitud, :latitude
  end
end
