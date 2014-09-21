class LinkedListCycleDetector
  def initialize list
    @list = list
  end

  def solve
    node = @list.first_node
    traversed_nodes = {}

    loop do
      return node if traversed_nodes[node]
      traversed_nodes[node] = true
      node = node.next
      break unless node
    end
  end
end
