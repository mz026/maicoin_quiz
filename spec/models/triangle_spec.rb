require 'models/triangle'

describe Triangle do
  let(:layer_array) do
    [
      [1],
      [3,2],
      [10,8,5],
      [6,7,2,9]
    ]
  end

  describe '::new(layer_array)' do
    it "takes an array representing layers of the triangle to init" do
      triangle = Triangle.new layer_array
    end

    it "raises if number of elements in layer_array do not increase by 1" do
      layer_array.last << 10
      expect {
        triangle = Triangle.new layer_array
      }.to raise_error(Triangle::InvalidArgumentException)
    end

    it "raises if layers < 2" do
      expect {
        Triangle.new [ [1] ]
      }.to raise_error(Triangle::InvalidArgumentException)
    end
  end

  describe '#layers' do
    it "returns the input layers" do
      triangle = Triangle.new layer_array
      expect(triangle.layers).to eq(layer_array)
    end
  end

  describe '#min_path', :demo => true do
    let(:triangle) { Triangle.new layer_array }
    it "returns array of min paths of each layer" do
      expect(triangle.min_path).to eq([ 1,2,5,2 ])
    end
  end
end
