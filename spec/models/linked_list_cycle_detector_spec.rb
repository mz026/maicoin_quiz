require 'models/linked_list_cycle_detector'

require 'lib/linked_list'
require 'lib/linked_list/node'

describe LinkedListCycleDetector do
  describe '::new(list)' do
    let(:list) { double(:list) }
    it "takes a linked list to init" do
      LinkedListCycleDetector.new list
    end
  end

  describe '#solve', :demo => true do
    def create_cyclic_list cycle_begin_node
      list = LinkedList.new

      list.add cycle_begin_node
      last_node = nil

      10.times do |i|
        node = LinkedList::Node.new i
        list.add node
        last_node = node if i == 9
      end
      last_node.next = cycle_begin_node

      list
    end

    def create_list 
      list = LinkedList.new

      10.times do |i|
        node = LinkedList::Node.new i
        list.add node
      end
      
      list
    end

    it "returns the node where cycle begins when cycle begins at the first node" do
      cycle_begin_node = LinkedList::Node.new 'cycle-begins-here'
      list = create_cyclic_list cycle_begin_node

      detector = LinkedListCycleDetector.new list

      expect(detector.solve).to eq(cycle_begin_node)
    end

    it "returns nil if no cycle" do
      list = create_list

      detector = LinkedListCycleDetector.new list
      expect(detector.solve).to eq(nil)
    end
  end
end
