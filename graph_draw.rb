class GraphDraw
  HEIGHT = 20
  VERTICAL_BORDER = "|"
  HORIZONTAL_BORDER = "-"
  EMPTY_CHAR = " "
  MARKER = "*"

  attr_accessor :data

  def initialize(data)
    self.data = data
  end

  def draw
    draw_data
    draw_x_axis
  end

  def draw_data
    HEIGHT.times do |i|
      this_line = HEIGHT - i
      keys_this_line = self.data.scaled_hash.select{ |k, v| v == this_line }.keys

      print VERTICAL_BORDER

      self.data.hash.each do |k, v|
        # Space to print before/after "*"
        # Try to print in middle, but if odd length, e.g. 5, print 2 space before + 3 after
        space_before = (k.length.to_f / 2).to_i
        space_after = k.length - space_before

        space_before.times{ print EMPTY_CHAR }
        print keys_this_line.include?(k) ? MARKER : EMPTY_CHAR
        space_after.times{ print EMPTY_CHAR }
      end
      print"\n"
    end
  end

  def draw_x_axis
    axis_length.times do
      print HORIZONTAL_BORDER
    end
    print "\n"

    data.array.each do |key, value|
      print " #{key}"
    end
    print "\n"
  end

  def axis_length
    @axis_length ||= self.data.array.map{ |a| a[0] }.inject(0) { |i, key, value| i += (key.length + 1) } + 1
  end
end
