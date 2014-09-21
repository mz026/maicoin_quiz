require 'models/path_simplifier'

describe PathSimplifier do
  describe '::new(path)' do
    it "takes a path string to init" do
      PathSimplifier.new('/the/path')
    end
  end

  shared_examples "simplify_path" do |method_name|
    describe "##{method_name}", :demo => true do
      it "removes trailing slash" do
        simplifier = PathSimplifier.new '/with/trailing/slash/'
        expect(simplifier.send(method_name)).to eq('/with/trailing/slash')
      end

      it "removes single dot" do
        simplifier = PathSimplifier.new('/with/./single/dot')
        expect(simplifier.send(method_name)).to eq('/with/single/dot')
      end

      it "removes double dot" do
        simplifier = PathSimplifier.new('/with/the/../double/dot')
        expect(simplifier.send(method_name)).to eq('/with/double/dot')
      end
    end

  end

  include_examples "simplify_path", :solve
  include_examples "simplify_path", :solve_by_ruby_build_in
end
