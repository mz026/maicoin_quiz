require 'models/ip_restorer'

describe IPRestorer do
  let(:ip_str_without_dot) { '12312212211' }

  describe '::new(ip_str_without_dot)' do
    it "takes an ip str without dot to init" do
      IPRestorer.new(ip_str_without_dot)    
    end

    it "raises if ip_str_without_dot.lenth not match /[0-9]{4,12}/" do
      expect {
        IPRestorer.new('123123456aaa')
      }.to raise_error(IPRestorer::InvalidIPFormatException)
    end
  end

  describe '#solve' do
    it "separates the raw ip by permuations of COMBINATIONS_OF_DIGITS" do
      restorer = IPRestorer.new ip_str_without_dot

      expected_ips = [ '123.122.122.11', '123.122.12.211', '123.12.212.211' ]

      ip_addresses = restorer.solve
      expect(ip_addresses).to eq(expected_ips)
    end  
  end
end
