require 'models/linked_list_to_bst_converter'
require 'lib/linked_list'
require 'lib/linked_list/node'
require 'lib/binary_tree_node'

describe LinkedListToBSTConverter do
  describe '::new(first_node)' do
    it "takes the first node of a list to init" do
      first_node = double(:first_node)
      converter = LinkedListToBSTConverter.new first_node
    end
  end

  describe '#solve' do
    def create_sorted_list
      list = LinkedList.new
      # (1..6).each do |i|
      (1..9).each do |i|
        list.add(LinkedList::Node.new i)
      end
      list
    end

    def expected_tree
      node_map = {}
      (1..9).each do |i|
        node_map[i] = BinaryTreeNode.new(i)
      end

      node_map[5].left = node_map[3]
      node_map[5].right = node_map[8]

      node_map[3].left = node_map[2]
      node_map[3].right = node_map[4]
      node_map[8].left = node_map[7]
      node_map[8].right = node_map[9]

      node_map[2].left = node_map[1]
      node_map[7].left = node_map[6]

      node_map[5]
    end

    it "returns a BinaryTreeNode instance which is height-balanced" do
      list = create_sorted_list

      converter = LinkedListToBSTConverter.new list.first_node

      tree, last_node = converter.solve
      expect(tree.to_a).to eq(expected_tree.to_a)
    end
  end
end
