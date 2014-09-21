require 'lib/linked_list'

describe LinkedList do
  let(:list) { LinkedList.new }

  describe '::new()' do
    it "takes no argument to init" do
      list = LinkedList.new 
    end
  end

  describe '#next' do
    it "returns nil when init" do
      expect(list.next).to be_nil
    end
  end

  describe '#add(node)' do
    let(:node1) { double(:node1) }
    let(:node2) { double(:node2) }

    it 'adds the node into list to the tail of list' do
      expect(list.next).to be_nil

      list.add(node1)
      expect(list.next).to eq(node1)

      list.add(node2)
      expect(list.next).to eq(node2)

      expect(list.next).to be_nil
    end
  end


end
