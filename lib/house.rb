require_relative "dwelling"

class House < Dwelling
  def initialize(address, city, state, zip_code, ask_price)
    super(address, city, state, zip_code)
    @ask_price = ask_price
  end
end
