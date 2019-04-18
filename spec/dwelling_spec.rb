require "spec_helper"

describe Dwelling do
  let(:dwelling) { Dwelling.new("221b Baker Street", "Boston", "MA", "02111") }
  it "has an address" do
    expect(dwelling.address).to eq("221b Baker Street")
  end

  it "has a city/town" do
    expect(dwelling.city_or_town).to eq("Boston")
  end

  it "has a state" do
    expect(dwelling.state).to eq("MA")
  end

  it "has a zip code" do
    expect(dwelling.zip_code).to eq("02111")
  end
end
