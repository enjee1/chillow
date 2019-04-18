require 'spec_helper'

describe Occupant do
  let(:person) { Occupant.new("John", "Doe") }

  it "has a first name" do
    expect(person.first_name).to eq("John")
  end

  it "has a last name" do
    expect(person.last_name).to eq("Doe")
  end
end
