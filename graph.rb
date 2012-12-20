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

puts data
puts data_array.inspect
