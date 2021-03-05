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
end
