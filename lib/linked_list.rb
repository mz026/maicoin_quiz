class LinkedList
  def initialize 
    @index = 0
    @nodes = []
  end

  def next
    current_node = @nodes[@index]
    @index += 1 if @nodes[@index]  

    current_node
  end

  def add node
    @nodes << node
  end
end
