class IPRestorer
  class InvalidIPFormatException < Exception; end
  IP_FORMAT = /\d{4,12}/

  # combinations of number of digits of each ip portion given the total length in raw string
  # say we have raw string whose length = 11
  # then the ip must look like xxx.xxx.xxx.xx or its permutation
  COMBINATIONS_OF_DIGITS = {
    4 => [ [1,1,1,1] ],
    5 => [ [2,1,1,1] ],
    6 => [ [3,1,1,1], [2,2,1,1] ],
    7 => [ [3,2,1,1], [2,2,2,1] ],
    8 => [ [3,3,1,1], [3,2,2,1], [2,2,2,2] ],
    9 => [ [3,3,2,1], [3,2,2,2] ],
    10 => [ [3,3,3,1], [3,3,2,2] ], 
    11 => [ [3,3,3,2] ],
    12 => [ [3,3,3,3] ]
  }
  
  def initialize ip_str_without_dot
    @raw = ip_str_without_dot.to_s

    validate
  end

  def validate
    unless ( matched = IP_FORMAT.match(@raw) ) && matched[0] == @raw
      raise InvalidIPFormatException, "Invalid ip format #{@raw}" 
    end
  end
  private :validate

  # solve:
  # for each separation in COMBINATIONS_OF_DIGITS * permutation, 
  # separate the raw string by the separation
  def solve
    ips = []

    COMBINATIONS_OF_DIGITS[@raw.length].each do |combination|
      combination.permutation(4).to_a.uniq.each do |separation|
        ips << separate_by(separation)
      end
    end

    ips.compact
  end

  # separate raw ip by separation, whose elements represent the length of each ip portion
  # return nil if any portion > 255, which is an invalid ip
  # for example, if separation = [ 3,3,3,2 ]
  # separate ip into xxx.xxx.xxx.xx
  def separate_by separation
    start_at = 0
    ip = separation.map do |length|
      ip_portion = @raw[start_at..(start_at + length - 1)]
      start_at += length

      ip_portion
    end

    return nil if ip.any? { |portion| portion.to_i > 255 }

    ip.join('.')
  end
  private :separate_by
end
