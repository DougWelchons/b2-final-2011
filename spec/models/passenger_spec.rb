require 'rails_helper'

RSpec.describe Passenger, type: :model do
  describe "relationships" do
    it {should have_many :passenger_flights}
    it {should have_many(:flights).through(:passenger_flights)}
  end

  describe "class methods" do
    before :each do
      @passenger1 = Passenger.create!(name: "Name1", age: 18)
      @passenger2 = Passenger.create!(name: "Name2", age: 20)
      @passenger3 = Passenger.create!(name: "Name4", age: 8)
      @passenger4 = Passenger.create!(name: "Name3", age: 34)
    end

    it ".adults" do
      expect(Passenger.adults).to eq([@passenger1, @passenger2, @passenger4])
    end

    it ".average_age" do
      expect(Passenger.average_age).to eq(20)
    end
  end
end
