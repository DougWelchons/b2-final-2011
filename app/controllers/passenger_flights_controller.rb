class PassengerFlightsController < ApplicationController

  def destroy
    @flight = Flight.find(params[:flight_id])
    @relationship = @flight.passenger_flights.where(passenger: "#{params[:passenger_id]}").first
    @relationship.destroy

    redirect_to("/flights/#{@flight.id}")
  end
end
