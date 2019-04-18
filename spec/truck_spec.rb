require "spec_helper"

describe Truck do
  describe "#initialize" do
    let(:george) { Occupant.new("George", "Costanza") }
    let(:jerry) { Occupant.new("Jerry", "Seinfeld") }
    let(:truck) { Truck.new(5) }
    let(:box_george) { Box.new(george.first_name, george.last_name) }
    let(:box_jerry) { Box.new(jerry.first_name, jerry.last_name) }

    it "has a maximum number of boxes it can hold" do
      expect(truck.max_boxes).to eq(5)
    end

    it "checks if it is full of boxes" do
      expect(truck.full?).to eq(false)
    end

  describe "#add_item" do
    it "adds boxes to its cargo are" do
      num_boxes = 4
      num_boxes.times do
        truck.add_item(box_george, truck.cargo_area)
      end
      expect(truck.full?).to eq(false)
      expect(truck.cargo_area.size).to eq(num_boxes)
    end
  end

  describe "#remove_item" do
    it "removes a box from the cargo area" do
      existing_boxes_count = 5
      existing_boxes_count.times do
        truck.add_item(box_jerry, truck.cargo_area)
      end
      truck.remove_item(truck.cargo_area)
      expect(truck.cargo_area.size).to eq(existing_boxes_count - 1)
    end
  end

  describe "#unload_boxes!"
    it "unloads all the boxes of a specific owner" do
      truck.add_item(box_jerry, truck.cargo_area)
      truck.add_item(box_jerry, truck.cargo_area)
      truck.add_item(box_jerry, truck.cargo_area)
      truck.add_item(box_george, truck.cargo_area)
      truck.add_item(box_george, truck.cargo_area)
      truck.unload_boxes!(box_george)
      expect(truck.cargo_area.any? { |box| box.last_name == "Costanza" }).to eq(false)
      expect(truck.cargo_area.size).to eq(3)
      expect(truck.cargo_area.any? { |box| box.last_name == "Seinfeld" }).to eq(true)
    end
  end
end
