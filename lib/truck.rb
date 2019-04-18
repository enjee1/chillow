require_relative "box"
require_relative "occupant"

class Truck
  attr_reader :max_boxes, :cargo_area

  def initialize(max_boxes)
    @max_boxes = max_boxes
    @cargo_area = []
  end

  def full?
    if @max_boxes == @cargo_area.count
      true
    else
      false
    end
  end

  def add_box!(box)
    if full?
      "No more boxes can be added to this truck."
    else
      @cargo_area << box
    end
  end

  def remove_box!
    if @cargo_area.size == 0
      "There are currently no boxes in the truck."
    else
      @cargo_area.pop
    end
  end

  def unload_boxes!(occupant_name)
    @cargo_area.reject! { |box| box.last_name == occupant_name.last_name }    
  end
end
