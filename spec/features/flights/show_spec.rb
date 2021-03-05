require 'rails_helper'

RSpec.describe "flight show page" do
  before :each do
    @flight1 = Flight.create!(number: 1, date: "8/11/21", time: "12:04", departure: "B city", arrival: "A city")
    @passenger1 = Passenger.create!(name: "Name1", age: 18)
    @passenger2 = Passenger.create!(name: "Name2", age: 20)
    @passenger3 = Passenger.create!(name: "Name3", age: 24)
    @passenger4 = Passenger.create!(name: "Name4", age: 10)
    Passenger_flight.create!(passenger: @passenger1, flight:@flight1)
    Passenger_flight.create!(passenger: @passenger2, flight:@flight1)
    Passenger_flight.create!(passenger: @passenger4, flight:@flight1)

    visit "/flights/#{@flight1.id}"
  end

  describe "when i visit a flights show page it" do
    it "shows the flights basic info" do
      within(".flight_info") do
        expect(page).to have_content("Flight number: #{@flight1.number}")
        expect(page).to have_content("Date and time: #{@flight1.date}, #{@flight1.time}")
        expect(page).to have_content("Departure City: #{@flight1.departure}")
        expect(page).to have_content("Arrival City: #{@flight1.arrival}")
    end

    it "shows all of the adult passengers on the flight"

    it "does not show children who are on the flight"

    it "does not show adults who are not on the flight"

    it "shows the average age of all adult passenfgers on the flight"

  end
end
