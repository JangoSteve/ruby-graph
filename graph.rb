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

puts "OUTPUT:\n"

max = data_hash.values.max
puts "MAX: #{max}"

height = 20

# Calculate scaled values
scaled_values = data_hash.values.map{ |v| (max.to_f / 20 * v).round }
puts scaled_values.inspect

height.times do
  puts "|"
end

axis_length = data_array.map{ |a| a[0] }.inject(0) { |i, key, value| i += (key.length + 1) } + 1
axis_length.times do
  print "-"
end
print "\n"

data_array.each do |key, value|
  print " #{key}"
end
