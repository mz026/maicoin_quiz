require 'lib/binary_tree_node'

describe BinaryTreeNode do
  let(:value) { 5 }
  let(:node) { BinaryTreeNode.new value }
  describe '::new(value)' do
    it "takes a value to init" do
      value = 5
      node = BinaryTreeNode.new value
    end
  end

  describe '#left=(left_node)' do
    it "assigns value to left" do
      left = BinaryTreeNode.new (value - 1)
      node.left = left

      expect(node.left).to eq(left)
    end

    it "raises if left_node.value > self.value " do
      left = BinaryTreeNode.new (value + 1)
      expect {
        node.left = left
      }.to raise_error(BinaryTreeNode::InvalidNodeException)
    end

    it "raises if left_node.value = self.value " do
      left = BinaryTreeNode.new value
      expect {
        node.left = left
      }.to raise_error(BinaryTreeNode::InvalidNodeException)
    end
  end

  describe '#right=(right_node)' do
    it "assigns value to right" do
      right = BinaryTreeNode.new (value + 1)
      node.right = right

      expect(node.right).to eq(right)
    end

    it "raises if right_node.value < self.value " do
      right = BinaryTreeNode.new (value - 1)
      expect {
        node.right = right
      }.to raise_error(BinaryTreeNode::InvalidNodeException)
    end
    
    it "raises if right_node.value = self.value " do
      right = BinaryTreeNode.new value
      expect {
        node.right = right
      }.to raise_error(BinaryTreeNode::InvalidNodeException)
    end
  end

  def node_of_val val
    @node_val_map ||= {}

    @node_val_map[val] ||= BinaryTreeNode.new val
  end

  def sample_tree_of_height_3
    root = BinaryTreeNode.new 10

    root.left = node_of_val(8)
    root.right = node_of_val(12)
    node_of_val(8).left = node_of_val(6)

    root
  end

  describe '#height' do
    it "calculates height of its tree" do
      root_of_height_3 = sample_tree_of_height_3
      expect(root_of_height_3.height).to eq(3)
    end
  end

  describe '#to_a' do
    it "models a tree as a multi-dimension array" do
      expected_array = [10, [8, [6, nil, nil], nil ], [12, nil, nil] ]
      expect(sample_tree_of_height_3.to_a).to eq(expected_array)
    end
  end


end
