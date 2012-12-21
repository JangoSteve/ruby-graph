# encoding: utf-8

class GraphDraw
  HEIGHT = 30
  VERTICAL_BORDER = "|"
  HORIZONTAL_BORDER = "-"
  EMPTY_CHAR = "\e[30m-\e[0m"
  VERTICAL_EMPTY_CHAR = "\e[30m+\e[0m"
  MARKER = "\e[32m◉\e[0m"
  SPACE_BETWEEN_X_LABELS = 5
  SHOW_OUTLINE = true
  SHOW_SCALE = true
  SCALE_PRECISION = 1

  attr_accessor :data

  def initialize(data)
    self.data = data
  end

  def draw
    draw_data
    draw_x_axis
  end

  def draw_data
    draw_x_border if SHOW_OUTLINE

    HEIGHT.times do |i|
      line = HEIGHT - i

      print scale_label(line) if SHOW_SCALE
      print VERTICAL_BORDER
      print EMPTY_CHAR * SPACE_BETWEEN_X_LABELS

      self.data.hash.each do |key, value|
        self.draw_data_line(line, key)
      end
      print "|" if SHOW_OUTLINE
      print "\n"
    end
  end

  def draw_data_line(line, key)
    # Space to print before/after "*"
    # Try to print in middle, but if odd length, e.g. 5, print 2 space before + 3 after
    print EMPTY_CHAR * space_before(key)
    print key_this_line?(line, key) ? MARKER : VERTICAL_EMPTY_CHAR
    print EMPTY_CHAR * space_after(key)
  end

  def scale_width
    precision_padding = SCALE_PRECISION + (SCALE_PRECISION > 0 ? 1 : 0)
    self.data.max.to_s.length + precision_padding
  end

  def scale_label(line)
    scaled_value(line).to_s.rjust(scale_width) + " "
  end

  def scaled_value(line)
    (line / self.data.scale).round(SCALE_PRECISION)
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
    draw_x_border

    draw_scale_space if SHOW_SCALE
    data.array.each do |key, value|
      print " " * SPACE_BETWEEN_X_LABELS
      print key
    end
    print "\n"
  end

  def draw_x_border
    draw_scale_space if SHOW_SCALE
    print "+"
    print HORIZONTAL_BORDER * axis_length
    puts "+"
  end

  def draw_scale_space
    print " " * (scale_width + 1)
  end

  def axis_length
    @axis_length ||= self.data.array.map{ |a| a[0] }.inject(0) { |i, key, value| i += (key.length + SPACE_BETWEEN_X_LABELS) } + SPACE_BETWEEN_X_LABELS
  end
end
