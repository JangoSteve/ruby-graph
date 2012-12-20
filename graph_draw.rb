class GraphDraw
  HEIGHT = 30
  VERTICAL_BORDER = "|"
  HORIZONTAL_BORDER = "-"
  EMPTY_CHAR = " "
  MARKER = "*"
  SPACE_BETWEEN_X_LABELS = 5

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
      line = HEIGHT - i

      print VERTICAL_BORDER
      SPACE_BETWEEN_X_LABELS.times{ print " " }

      self.data.hash.each do |key, value|
        self.draw_data_line(line, key)
      end
      print"\n"
    end
  end

  def draw_data_line(line, key)
    # Space to print before/after "*"
    # Try to print in middle, but if odd length, e.g. 5, print 2 space before + 3 after
    space_before(key).times{ print EMPTY_CHAR }
    print key_this_line?(line, key) ? MARKER : EMPTY_CHAR
    space_after(key).times{ print EMPTY_CHAR }
  end

  def key_this_line?(line, key)
    self.data.scaled_hash.any?{ |k, v| k == key && v == line }
  end

  def space_before(key)
    (key.length.to_f / 2).to_i - 1
  end

  def space_after(key)
    (key.length + SPACE_BETWEEN_X_LABELS) - space_before(key) - 1
  end

  def draw_x_axis
    axis_length.times{ print HORIZONTAL_BORDER }
    print "\n"

    data.array.each do |key, value|
      SPACE_BETWEEN_X_LABELS.times{ print " " }
      print key
    end
    print "\n"
  end

  def axis_length
    @axis_length ||= self.data.array.map{ |a| a[0] }.inject(0) { |i, key, value| i += (key.length + SPACE_BETWEEN_X_LABELS) } + SPACE_BETWEEN_X_LABELS
  end
end
