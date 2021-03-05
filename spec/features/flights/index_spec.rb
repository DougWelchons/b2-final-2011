require 'rails_helper'

RSpec.describe "flights index page" do
  before :each do
    @flight1 = Flight.create!(number: 1, departure: "B city", arrival: "A city")
    @flight2 = Flight.create!(number: 2, departure: "A city", arrival: "Y city")
    @flight3 = Flight.create!(number: 3, departure: "K city", arrival: "M city")
    @flight4 = Flight.create!(number: 4, departure: "D city", arrival: "C city")
    @flight5 = Flight.create!(number: 5, departure: "D city", arrival: "A city")
    @flight6 = Flight.create!(number: 6, departure: "F city", arrival: "A city")

    visit "/flights"
  end

  describe "when i visit the flights index page it" do
    it "shows each flights in the systems info" do
      within(".flights") do
        within("#flight_#{@flight1.id}") do
          expect(page).to have_content("Flight number: #{@flight1.number}")
          expect(page).to have_content("Departure City: #{@flight1.departure}")
          expect(page).to have_content("Arrival City: #{@flight1.arrival}")
        end
        within("#flight_#{@flight2.id}") do
          expect(page).to have_content("Flight number: #{@flight2.number}")
          expect(page).to have_content("Departure City: #{@flight2.departure}")
          expect(page).to have_content("Arrival City: #{@flight2.arrival}")
        end
        within("#flight_#{@flight3.id}") do
          expect(page).to have_content("Flight number: #{@flight3.number}")
          expect(page).to have_content("Departure City: #{@flight3.departure}")
          expect(page).to have_content("Arrival City: #{@flight3.arrival}")
        end
        within("#flight_#{@flight4.id}") do
          expect(page).to have_content("Flight number: #{@flight4.number}")
          expect(page).to have_content("Departure City: #{@flight4.departure}")
          expect(page).to have_content("Arrival City: #{@flight4.arrival}")
        end
        within("#flight_#{@flight5.id}") do
          expect(page).to have_content("Flight number: #{@flight5.number}")
          expect(page).to have_content("Departure City: #{@flight5.departure}")
          expect(page).to have_content("Arrival City: #{@flight5.arrival}")
        end
        within("#flight_#{@flight6.id}") do
          expect(page).to have_content("Flight number: #{@flight6.number}")
          expect(page).to have_content("Departure City: #{@flight6.departure}")
          expect(page).to have_content("Arrival City: #{@flight6.arrival}")
        end
      end
    end

    it "lists each flight in alphabetically by departure city" do
      expect("Flight number: #{@flight2.number}").to appear_before("Flight number: #{@flight1.number}")
      expect("Flight number: #{@flight1.number}").to appear_before("Flight number: #{@flight4.number}")
      expect("Flight number: #{@flight4.number}").to appear_before("Flight number: #{@flight5.number}")
      expect("Flight number: #{@flight5.number}").to appear_before("Flight number: #{@flight6.number}")
      expect("Flight number: #{@flight6.number}").to appear_before("Flight number: #{@flight3.number}")
    end

    it "lists each flight by number of passengers"
  end
end
