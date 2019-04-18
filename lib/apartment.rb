require_relative "dwelling"

class Apartment < Dwelling
  attr_reader :rent, :lease_start_date, :lease_end_date,
              :max_occupants, :current_occupants


  def full?
    @max_occupants == @current_occupants
  end

  def add_roommate!(num)
    if full?
      "No more tenants can move in here."
    elsif @current_occupants + num > @max_occupants
      "There is not enough space to add #{num} more roommates." + "\n" +
      "There are currently #{@current_occupants} tenants in this apartment."
    else
      @current_occupants += num
    end
  end

  def remove_roommate!(num)
    if @current_occupants == 0
      "There are currently no tenants living here"
    else
      @current_occupants -= num
    end
  end
end
