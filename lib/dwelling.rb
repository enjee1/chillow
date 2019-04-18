class Dwelling
  attr_reader :address, :city_or_town, :state, :zip_code

  def initialize(address, city, state, zip_code)
    @address = address
    @city_or_town = city
    @state = state
    @zip_code = zip_code
  end
end
