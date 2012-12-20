data = <<-EOC
  Jan 1
  Feb 19
  Mar 1
  Apr 5
  May 5
  Jun 7
  Jul 1
  Aug 9
  Sep 2
  Oct 14
  Nov 4
  Dec 6
EOC

data_array = data.split(/\n/).map(&:strip).reject{ |s| s.nil? || s == "" }.map{ |s| s.split(/\s/) }
data_hash = Hash[data_array].inject(Hash.new){ |h, a| h[a[0]] = a[1].to_i; h }

max = data_hash.values.max

height = 20

# Calculate scaled values
scaled_hash = data_hash.inject(Hash.new){ |h, a| h[a[0]] = (max.to_f / 20 * a[1]).round; h }

axis_length = data_array.map{ |a| a[0] }.inject(0) { |i, key, value| i += (key.length + 1) } + 1

height.times do |i|
  this_line = height - i
  keys_this_line = scaled_hash.select{ |k, v| v == this_line }.keys

  print "|"

  data_hash.each do |k, v|
    print " #{keys_this_line.include?(k) ? "*" : " "}  "
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
