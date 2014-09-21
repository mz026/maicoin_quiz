class LinkedList
  attr_reader :first_node
  def add node
    if @first_node
      @last_node.next = node
    else
      @first_node = node unless @first_node
    end

    @last_node = node
  end
end
