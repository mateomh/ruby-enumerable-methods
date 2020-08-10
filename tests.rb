require './enumerable'

my_array = %w[jerry tom dine]


puts "Test #my_each method"
my_array.my_each do |elem|
  puts elem
end
puts "- - - -"

puts "Test #my_each_with_index method"
my_array.my_each_with_index do |elem, index|
  puts "Element: " + elem + " | " + "Index: " + index.to_s
end
puts "- - - -"

puts "Test #my_select method"
var1 = (1..10).my_select { |i|  i % 3 == 0 }
print var1
print "\n"
puts "- - - -"

puts "Test #my_all method"
puts %w[ant bear cat].my_all? { |word| word.length >= 3 } #=> true
puts [1, 2i, 3.14].all?(Numeric) #=> true
puts %w[ant bear cat].all? { |word| word.length >= 4 } #=> false