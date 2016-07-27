class Location < ActiveRecord::Base
    has_many :slots
    
    validates :latitude, numericality: {only_float:true}
    validates :longitude, numericality: {only_float: true}
    validates :address, presence: true
    
    after_validation :geocode, if: ->(obj) {obj.address.present? && obj.address_changed?}
    geocoded_by :address
    reverse_geocoded_by :latitude, :longitude
    
end
