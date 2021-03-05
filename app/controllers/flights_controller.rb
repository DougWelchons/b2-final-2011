class FlightsController < ApplicationController

  def index
    @flights = Flight.alphabetical
  end

  def show
    @flight = Flight.find(params[:id])
  end
end
