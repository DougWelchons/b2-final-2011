class PassengerFlight < ApplicationRecord
  belongs_to :passenger
  belongs_to :flight

  def self.find_passenger_relationship(passenger_id)
    where(passenger: "#{passenger_id}")
  end
end
