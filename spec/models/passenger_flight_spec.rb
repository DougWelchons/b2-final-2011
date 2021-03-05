require 'rails_helper'

RSpec.describe PassengerFlight, type: :model do
  describe "relationships" do
    it {should belong_to :flight}
    it {should belong_to :passenger}
  end

  describe "class methods" do
    before :each do
      @flight1 = Flight.create!(number: 1, date: "8/11/21", time: "12:04", departure: "B city", arrival: "A city")
      @flight2 = Flight.create!(number: 1, date: "8/11/21", time: "12:10", departure: "B city", arrival: "A city")
      @passenger1 = Passenger.create!(name: "Name1", age: 18)
      @passenger2 = Passenger.create!(name: "Name2", age: 20)
      @passenger3 = Passenger.create!(name: "Name3", age: 24)
      @passenger4 = Passenger.create!(name: "Name4", age: 10)
      @pf1 = PassengerFlight.create!(passenger: @passenger1, flight:@flight1)
      @pf2 = PassengerFlight.create!(passenger: @passenger3, flight:@flight1)
      @pf3 = PassengerFlight.create!(passenger: @passenger4, flight:@flight1)
      @pf4 = PassengerFlight.create!(passenger: @passenger1, flight:@flight2)
    end

    it ".find_passenger_relationship" do
      expect(PassengerFlight.find_passenger_relationship(@passenger1.id)).to eq([@pf1, @pf4])
    end
  end
end
