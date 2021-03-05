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
      @passenger3 = Passenger.create!(name: "Name4", age: 10)
      @passenger4 = Passenger.create!(name: "Name3", age: 24)
    end

    it ".adults" do
      expect(@flight1.adult_passengers).to eq([@passenger1, @passenger2, @passenger4])
    end
  end
end
