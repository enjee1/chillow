require 'spec_helper'

describe Occupant do
  let(:occupant) { Occupant.new("John", "Doe") }

  describe "#initialize" do
    it "has a first name" do
      expect(occupant.first_name).to eq("John")
    end

    it "has a last name" do
      expect(occupant.last_name).to eq("Doe")
    end
  end
end
