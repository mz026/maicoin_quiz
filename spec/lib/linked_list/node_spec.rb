require 'lib/linked_list/node'

describe LinkedList::Node do
  describe '#new(value)' do
    let(:value) { 123 }
    it "takes a value to init" do
      LinkedList::Node.new(value)
    end
  end

  describe '#to_s' do
    let(:value) { double(:value, :to_s => 'the-value-string') }
    it "returns its value.to_s" do
      node = LinkedList::Node.new value
      expect(node.to_s).to eq(value.to_s)
    end
  end

  describe '#next' do
    let(:value) { 1234 }
    let(:node) { LinkedList::Node.new value }

    it "can read/assign attr `next`" do
      next_node = double(:next_node)

      node.next = next_node
      expect(node.next).to eq(next_node)
    end
  end
end
