class Location < ActiveRecord::Base
  belongs_to :vehicle
  belongs_to :slot
end
