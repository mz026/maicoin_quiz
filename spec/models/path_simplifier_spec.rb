require 'models/path_simplifier'

describe PathSimplifier do
  describe '::new(path)' do
    it "takes a path string to init" do
      PathSimplifier.new('/the/path')
    end
  end

  describe '#solve' do
    it "removes trailing slash" do
      simplifier = PathSimplifier.new '/with/trailing/slash/'
      expect(simplifier.solve).to eq('/with/trailing/slash')
    end

    it "removes single dot" do
      simplifier = PathSimplifier.new('/with/./single/dot')
      expect(simplifier.solve).to eq('/with/single/dot')
    end

    it "removes double dot" do
      simplifier = PathSimplifier.new('/with/the/../double/dot')
      expect(simplifier.solve).to eq('/with/double/dot')
    end
  end
end
