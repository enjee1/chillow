require "spec_helper"

describe Box do
  let(:jerry) { Occupant.new("Jerry", "Seinfeld") }

  describe "#initialize" do
    it "has a first name and last name" do
      box_jerry = Box.new(jerry.first_name, jerry.last_name)
      expect(box_jerry.first_name).to eq("Jerry")
      expect(box_jerry.last_name).to eq("Seinfeld")
    end
  end
end
