require './enumerable'

my_array = %w[jerry tom dine]

test_array1 = [11, 2, 3, 56]
test_array2 = %w(a b c d)
test_array3 = %w[f g h i]

puts "Test #my_each method"
p 'my_each'
test_array1.my_each { |x| p x }
test_array2.my_each { |x| p x }
# p test_array2.my_each
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
puts [1, 2i, 3.14].my_all?(Numeric) #=> true
puts %w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false

puts "Test #my_all method"
puts [nil, true, 99].my_any?(Integer)  #=> true
puts %w[ant bear cat].my_any? { |word| word.length >= 3 } #=> true
puts [].my_any?                                           #=> false