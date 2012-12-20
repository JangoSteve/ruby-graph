class DataProcess
  attr_accessor :data

  def initialize(file_path)
    self.data = File.read('data.txt')
  end

  def array
    # Break into array, e.g. [["Jan", 1], ["Feb", 19], etc]
    @array ||= self.data.split(/\n/).reject{ |s| s.nil? || s == "" }.map{ |s| s.strip.split(/\s+/) }
  end

  def hash
    # Create hash to work with, e.g. {"Jan" => 1, "Feb" => 2, etc}
    @hash ||= Hash[self.array].inject(Hash.new){ |h, a| h[a[0]] = a[1].to_i; h }
  end

  def max
    @max ||= self.hash.values.max
  end

  def scaled_hash
    # Calculate scaled values
    @scaled_hash ||= self.hash.inject(Hash.new){ |h, a| h[a[0]] = (self.max.to_f / 20 * a[1]).round; h }
  end

end
