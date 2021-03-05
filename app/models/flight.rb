class Flight < ApplicationRecord
  has_many :passenger_flights
  has_many :passengers, through: :passenger_flights

  def self.alphabetical
    order(:departure)
  end
end
