require './data.rb'

# -----------------
# CONFIG
# -----------------
HEIGHT = 20

data = Data.new('data.txt')
axis_length = data.array.map{ |a| a[0] }.inject(0) { |i, key, value| i += (key.length + 1) } + 1

# -----------------
# PRINT GRAPH
# -----------------
HEIGHT.times do |i|
  this_line = HEIGHT - i
  keys_this_line = data.scaled_hash.select{ |k, v| v == this_line }.keys

  print "|"

  data.hash.each do |k, v|
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

data.array.each do |key, value|
  print " #{key}"
end
print "\n"
