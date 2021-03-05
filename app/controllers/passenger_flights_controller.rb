class PassengerFlightsController < ApplicationController

  def destroy
    @flight = Flight.find(params[:flight_id])
    @relationship = @flight.find_passenger_flight_record("#{params[:passenger_id]}")
    @relationship.destroy

    redirect_to("/flights/#{@flight.id}")
  end
end
