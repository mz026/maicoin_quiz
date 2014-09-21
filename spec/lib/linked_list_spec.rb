require 'lib/linked_list'

describe LinkedList do
  let(:list) { LinkedList.new }

  describe '::new()' do
    it "takes no argument to init" do
      list = LinkedList.new 
    end
  end

  describe '#first_node' do
    it "returns nil if empty list" do
      expect(list.first_node).to be_nil
    end

    it "returns first node if exists" do
      first_node = double(:first_node)
      list.add(first_node)
      expect(list.first_node).to eq(first_node)
    end
  end

  describe '#add(node)' do
    let(:original_last_node) { double(:original_last_node) }
    let(:added_node) { double(:added_node) }

    it "assigns the node to `first_node` if list is empty" do
      list.add(added_node)  

      expect(list.first_node).to eq(added_node)
    end

    it "assigns the added_node to be the `next` of last node" do
      expect(original_last_node).to receive(:next=).with(added_node)
      list.add(original_last_node)
      list.add(added_node)
    end
  end
end
