class LinkedList
  class Node
    attr_accessor :next
    def initialize value
      @value = value
    end

    def to_s
      @value.to_s
    end
  end
end
