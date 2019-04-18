require "spec_helper"

describe Apartment do
  let(:apartment) { Apartment.new(
    "129 West 81st Street", "New York", "NY", "10211", 7000,
    "September 1, 2020", "August 31, 2023", 4) }
  let(:occupant) { Occupant.new("George", "Costanza") }

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

  describe "#full?" do
    it "returns false when the apartment is vacant" do
      expect(apartment.full?).to eq(false)
    end

    it "returns true when the maximum number of tenants have been added to
        the apartment" do
      4.times do
        apartment.add_roommate!(occupant)
      end
      expect(apartment.full?).to eq(true)
    end
  end

  describe "#add_roommate!" do
    context "apartment isn't full" do
      it "adds a tenant to the current occupants list" do
        apartment.add_roommate!(occupant)
        expect(apartment.current_occupants[0]).to be_a(Occupant)
        expect(apartment.current_occupants.size).to eq(1)
      end
    end

    context "apartment is at maximum capacity for tenants" do
      it "displays a message that the apartment is full and no further
        tenants can be added" do
        error_message = "No more tenants can move in here."
        4.times do
          apartment.add_roommate!(occupant)
        end
        expect(apartment.add_roommate!(occupant)).to eq(error_message)
      end
    end
  end

  describe "#remove_roommate!" do
    context "the apartment has tenants living in it" do
      it "removes a tenants from the current occupants" do
        confirmation = "Tenant removed from occupant list."
        2.times do
          apartment.add_roommate!(occupant)
        end
        expect(apartment.remove_roommate!).to eq("Tenant removed from " +
              "occupant list.")
      end
    end

    context "the apartment is vacant" do
      it "displays a message that the apartment is vacant" do
        error_message = "There are currently no tenants living here"
        expect(apartment.remove_roommate!).to eq("There are currently no " +
            "tenants living here")
      end
    end
  end

end
