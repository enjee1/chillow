require "spec_helper"

describe Apartment do
  let(:apartment) { Apartment.new(
    "129 West 81st Street", "New York", "NY", "10211", 7000, "September 1, 2020",
    "August 31, 2023", 4) }

  describe "initialize"
    it "has a monthly rent amount" do
      expect(apartment.rent).to eq(7000)
    end

    it "has a lease start date" do
      expect(apartment.lease_start_date).to eq("September 1, 2020")
    end

    it "has a lease end date" do
      expect(apartment.lease_end_date).to eq("August 31, 2023")
    end

    it "has a maximum occupancy" do
      expect(apartment.max_occupants).to eq(4)
    end

  describe "#add_roommate!" do
    context "apartment isn't full" do
      it "adds a tenant to the current occupants of the apartment " do
        apartment.add_roommate!(2)
        expect(apartment.current_occupants).to eq(2)
      end
    end

    context "apartment is at maximum capacity for tenants" do
      it "displays a message that the apartment is full and no further
        tenants can be added" do
        apartment.add_roommate!(4)
        expect(apartment.add_roommate!(1)).to eq("No more tenants can move in here.")
      end
    end

    context "apartment is not at maximum capacity, but only a certain number of
      tenants can be added" do
        it "displays a message that adding more tenants will exceed the maximum capacity" do
          error_message = "There is not enough space to add 2 more roommates." + "\n" +
          "There are currently 3 tenants in this apartment."
          apartment.add_roommate!(3)
          expect(apartment.add_roommate!(2)).to eq(error_message)
        end
      end
  end

  describe "#remove_roommate!" do
    context "the apartment has tenants living in it" do
      it "removes a tenants from the current occupants" do
        apartment.add_roommate!(4)
        apartment.remove_roommate!(2)
        expect(apartment.current_occupants).to eq(2)
      end

    context "the apartment is vacant" do
      it "displays a message that the apartment is vacant" do
        error_message = "There are currently no tenants living here"
        expect(apartment.remove_roommate!(2)).to eq(error_message)
      end
    end
  end

  describe "#full?" do
    it "is returns true when the maximum number of tenants have been added to the apartment" do
      apartment.max_occupants.times do
        apartment.add_roommate!(1)
      end
      expect(apartment.full?).to be(true)
    end
  end
end
