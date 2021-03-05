class Passenger < ApplicationRecord
  has_many :passenger_flights
  has_many :flights, through: :passenger_flights

  def self.adults
    where('age >= ?', '18')
  end
end
