class Taxi < ActiveRecord::Base
  has_many :bookings
  has_many :drivers
  has_one :location
end
