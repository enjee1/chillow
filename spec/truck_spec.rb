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

  describe "#add_box!" do
    context "truck is empty" do
      it "adds boxes to its cargo are" do
        num_boxes = 4
        num_boxes.times do
          truck.add_box!(box_george)
        end
        expect(truck.full?).to eq(false)
        expect(truck.cargo_area.size).to eq(num_boxes)
      end
    end

    context "truck is already full" do
      it "returns a message that the truck is full" do
        existing_boxes_count = 5
        existing_boxes_count.times do
          truck.add_box!(box_jerry)
        end
        error_message = "No more boxes can be added to this truck."

        expect(truck.add_box!(box_george)).to eq(error_message)
        expect(truck.full?).to eq(true)
      end
    end
  end

  describe "#remove_box!" do
    context "truck has boxes in its cargo area" do
      it "removes a box from the cargo area" do
        existing_boxes_count = 5
        existing_boxes_count.times do
          truck.add_box!(box_jerry)
        end
        truck.remove_box!
        expect(truck.cargo_area.size).to eq(existing_boxes_count - 1)
      end
    end
    context "truck is empty" do
      it "displays an error that there are no boxes in the truck to remove" do
        error_message = "There are currently no boxes in the truck."
        expect(truck.remove_box!).to eq("There are currently no boxes in the truck.")
      end
    end
  end

  describe "#unload_boxes!"
    it "unloads all the boxes of a specific owner" do
      truck.add_box!(box_jerry)
      truck.add_box!(box_jerry)
      truck.add_box!(box_jerry)
      truck.add_box!(box_george)
      truck.add_box!(box_george)
      truck.unload_boxes!(box_george)
      expect(truck.cargo_area.any? { |box| box.last_name == "Costanza" }).to eq(false)
      expect(truck.cargo_area.size).to eq(3)
      expect(truck.cargo_area.any? { |box| box.last_name == "Seinfeld" }).to eq(true)
    end
  end
end
