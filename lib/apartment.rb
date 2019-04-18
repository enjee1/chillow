require_relative "dwelling"

class Apartment < Dwelling
  attr_reader :rent, :lease_start_date, :lease_end_date,
              :max_occupants, :current_occupants

  def initialize(address, city, state, zip_code, rent,
      lease_start_date, lease_end_date, max_occupants)
    super(address, city, state, zip_code)
    @rent = rent
    @lease_start_date = lease_start_date
    @lease_end_date = lease_end_date
    @max_occupants = max_occupants
    @current_occupants = []
  end

  def full?
    @max_occupants == @current_occupants.size
  end

  def add_roommate!(tenant)
    if full?
      "No more tenants can move in here."
    else
      @current_occupants << tenant
      "Tenant added to occupant list."
    end
  end

  def remove_roommate!
    if @current_occupants.size == 0
      "There are currently no tenants living here"
    else
      @current_occupants.pop
      "Tenant removed from occupant list."
    end
  end
end
