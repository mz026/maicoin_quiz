class LinkedListCycleDetector
  def initialize list
    @list = list
  end

  # solve
  # remember every traversed node and return true when traversing to a visited one
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
