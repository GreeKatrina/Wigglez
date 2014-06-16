module Wigglez
  class Wig
    attr_reader :id, :donor, :receiver, :tracking_number, :received, :material, :color, :length, :gender, :retail_estimate, :date_picked, :condition, :construction, :size

    def initialize(id, donor, receiver, tracking_number, received, material, color, length, gender, retail_estimate, date_picked, condition, construction, size)
      @id = id
      @donor = donor
      @receiver = receiver
      @tracking_number = tracking_number
      @received = received
      @material = material
      @color = color
      @length = length
      @gender = gender
      @retail_estimate = retail_estimate
      @date_picked = date_picked
      @condition = condition
      @construction = construction
      @size = size
    end
  end
end
