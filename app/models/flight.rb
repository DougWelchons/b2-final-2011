class Flight < ApplicationRecord
  has_many :passenger_flights
  has_many :passengers, through: :passenger_flights

  def self.alphabetical
    order(:departure)
  end

  def adult_passengers
    passengers.adults
  end

  def average_adult_age
    adult_passengers.average_age
  end
end
