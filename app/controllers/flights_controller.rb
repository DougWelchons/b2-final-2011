class FlightsController < ApplicationController

  def index
    @flights = Flight.alphabetical
  end
end
