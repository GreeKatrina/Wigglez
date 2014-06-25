module Wigglez
  class Wig
    attr_reader :id, :donor_id, :receiver, :tracking_number, :received, :material, :color, :length, :gender, :retail_estimate, :date_picked, :condition, :construction, :size

    def initialize(attrs={})
      @id = attrs[:id]
      @donor_id = attrs[:donor_id]
      @receiver = attrs[:receiver]
      @tracking_number = attrs[:tracking_number]
      @received = attrs[:received]
      @material = attrs[:material]
      @color = attrs[:color]
      @length = attrs[:length]
      @gender = attrs[:gender]
      @retail_estimate = attrs[:retail_estimate]
      @date_picked = attrs[:date_picked]
      @condition = attrs[:condition]
      @construction = attrs[:construction]
      @size = attrs[:size]
    end
  end
end
