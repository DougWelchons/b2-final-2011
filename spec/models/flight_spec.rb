require 'rails_helper'

RSpec.describe Flight, type: :model do
  describe "relationships" do
    it {should have_many :passenger_flights}
    it {should have_many(:passengers).through(:passenger_flights)}
  end

  describe "class methods" do
    before :each do
      @flight1 = Flight.create!(number: 1, departure: "B city", arrival: "A city")
      @flight2 = Flight.create!(number: 2, departure: "A city", arrival: "Y city")
      @flight3 = Flight.create!(number: 3, departure: "K city", arrival: "M city")
      @flight4 = Flight.create!(number: 4, departure: "D city", arrival: "C city")
      @flight5 = Flight.create!(number: 5, departure: "D city", arrival: "A city")
      @flight6 = Flight.create!(number: 6, departure: "F city", arrival: "A city")
    end

    it ".alphabetical" do
      expect(Flight.alphabetical).to eq([@flight2, @flight1, @flight4, @flight5, @flight6, @flight3])
    end
  end

  describe "instance methods" do
    before :each do
      @flight1 = Flight.create!(number: 1, date: "8/11/21", time: "12:04", departure: "B city", arrival: "A city")
      @passenger1 = Passenger.create!(name: "Name1", age: 18)
      @passenger2 = Passenger.create!(name: "Name2", age: 20)
      @passenger3 = Passenger.create!(name: "Name3", age: 24)
      @passenger4 = Passenger.create!(name: "Name4", age: 10)
      PassengerFlight.create!(passenger: @passenger1, flight:@flight1)
      PassengerFlight.create!(passenger: @passenger3, flight:@flight1)
      PassengerFlight.create!(passenger: @passenger4, flight:@flight1)
    end

    it "#adult_passengers" do
      expect(@flight1.adult_passengers).to eq([@passenger1, @passenger3])
    end
  end
end
