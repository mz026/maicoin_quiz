class Triangle
  class InvalidArgumentException < Exception; end
  attr_reader :layers

  def initialize layer_array
    @layers = layer_array
    validate
  end

  def validate
    layer_size = @layers.count
    raise InvalidArgumentException, "a dot can not be a triangle" if layer_size < 2

    (1..layer_size).each do |i|
      raise InvalidArgumentException, "element count in triangle layer #{i} not match" unless @layers[i - 1].count == i
    end
  end
  private :validate
end
