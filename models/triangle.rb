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

  # min_path
  # recursively divide the triangle into 2 children: left and right
  # and find/compare the min paths of each child
  # say we have a triangle of
  #
  # [
  #   [1],
  #   [3,2],
  #   [10,8,5],
  #   [6,7,2,9]
  # ]
  #
  # then the left child would be
  # [
  #   [3],
  #   [10,8],
  #   [6,7,2]
  # ]
  #
  # and the right one would be
  # [
  #   [2],
  #   [8,5],
  #   [7,2,9]
  # ]
  #
  # when we hit the bottom case in which there are only 2 layers in a triangle,
  # the min path can be found intuitively by comparing of its two children

  def min_path
    if @layers.count == 2
      return [ top ] + [ @layers[1].min ]
    end

    left_min_path = left_child.min_path
    left_min_path_sum = left_min_path.inject(0, :+)
    right_min_path = right_child.min_path
    right_min_path_sum = right_min_path.inject(0, :+)

    if left_min_path_sum < right_min_path_sum
      [ top ] + left_child.min_path 
    else
      [ top ] + right_child.min_path
    end
  end

  def top
    @layers.first.first
  end
  private :top

  def left_child
    sub_arr = @layers[1..-1].map do |layer|
      layer[0..-2]
    end

    Triangle.new sub_arr
  end
  private :left_child

  def right_child
    sub_arr = @layers[1..-1].map do |layer|
      layer[1..-1]
    end

    Triangle.new sub_arr
  end
  private :right_child
end
