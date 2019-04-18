require_relative "Occupant"

class Box < Occupant
  attr_reader :first_name, :last_name
  
  def initialize(first_name, last_name)
    super(first_name, last_name)
  end
end
