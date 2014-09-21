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
end
