require "spec_helper"

describe Dwelling do
  let(:dwelling) { Dwelling.new("129 West 81st Street", "New York", "NY", "10211") }

  describe "#initialize" do
    it "has an address" do
      expect(dwelling.address).to eq("129 West 81st Street")
    end

    it "has a city/town" do
      expect(dwelling.city_or_town).to eq("New York")
    end

    it "has a state" do
      expect(dwelling.state).to eq("NY")
    end

    it "has a zip code" do
      expect(dwelling.zip_code).to eq("10211")
    end
  end
end
