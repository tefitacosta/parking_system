class Slot < ActiveRecord::Base
  has_many :park_records
  has_many :vehicles, through: :park_records
  belongs_to :location
end
