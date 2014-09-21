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

  shared_examples "ensure_attr_accessor" do |attr_name|
    describe "##{attr_name}" do
      it "accepts read/write opeartions as an accessor" do
        to_be_assigned = double(:to_be_assigned)

        node.send("#{attr_name}=", to_be_assigned)
        expect(node.send(attr_name)).to eq(to_be_assigned)
      end
    end
  end

  include_examples "ensure_attr_accessor", :left
  include_examples "ensure_attr_accessor", :right

  describe '#height' do
    def node_of_val val
      @node_val_map ||= {}

      @node_val_map[val] ||= BinaryTreeNode.new val
    end

    it "calculates height of its tree" do
      root_of_height_3 = BinaryTreeNode.new 10

      root_of_height_3.left = node_of_val(8)
      root_of_height_3.right = node_of_val(12)
      node_of_val(8).left = node_of_val(6)

      expect(root_of_height_3.height).to eq(3)
    end
  end


end
