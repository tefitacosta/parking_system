class RenameLocationsLocationLongitudetoLongitude < ActiveRecord::Migration
  def change
    rename_column :locations, :location_longitude, :longitude
  end
end
