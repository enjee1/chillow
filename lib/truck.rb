require_relative "box"
require_relative "occupant"
require_relative "update_contents"

class Truck
  attr_reader :max_boxes, :cargo_area
  include UpdateContents

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

  def unload_boxes!(occupant_name)
    @cargo_area.reject! { |box| box.last_name == occupant_name.last_name }
  end
end
