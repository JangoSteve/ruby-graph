# -----------------
# READ DATA
# -----------------
data = File.read('data.txt')

# -----------------
# CONFIG
# -----------------
HEIGHT = 20

# -----------------
# CALCULATIONS
# -----------------

# Break into array, e.g. [["Jan", 1], ["Feb", 19], etc]
data_array = data.split(/\n/).reject{ |s| s.nil? || s == "" }.map{ |s| s.strip.split(/\s+/) }

# Create hash to work with, e.g. {"Jan" => 1, "Feb" => 2, etc}
data_hash = Hash[data_array].inject(Hash.new){ |h, a| h[a[0]] = a[1].to_i; h }

max = data_hash.values.max

# Calculate scaled values
scaled_hash = data_hash.inject(Hash.new){ |h, a| h[a[0]] = (max.to_f / 20 * a[1]).round; h }

axis_length = data_array.map{ |a| a[0] }.inject(0) { |i, key, value| i += (key.length + 1) } + 1

# -----------------
# PRINT GRAPH
# -----------------
HEIGHT.times do |i|
  this_line = HEIGHT - i
  keys_this_line = scaled_hash.select{ |k, v| v == this_line }.keys

  print "|"

  data_hash.each do |k, v|
    # Space to print before/after "*"
    # Try to print in middle, but if odd length, e.g. 5, print 2 space before + 3 after
    space_before = (k.length.to_f / 2).to_i
    space_after = k.length - space_before

    space_before.times{ print " " }
    print keys_this_line.include?(k) ? "*" : " "
    space_after.times{ print " "}
  end
  print"\n"
end

axis_length.times do
  print "-"
end
print "\n"

data_array.each do |key, value|
  print " #{key}"
end
print "\n"
