class Location < ActiveRecord::Base
  has_many :slots

  validates :latitude, numericality: { only_float: true }, presence: true

  validates :longitude, numericality: { only_float: true }, presence: true

end
