require './enumerable'

my_array = %w[jerry tom dine]

test_array1 = [11, 2, 3, 56]
test_array2 = %w(a b c d)
test_array3 = %w[f g h i]

puts "Test #my_each method"
puts 'my_each'
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
puts "- - - -\n"

puts 'Test #my_all method'
puts %w[ant bear cat].my_all? { |word| word.length >= 3 } #=> true
puts %w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
puts %w[ant bear cat].my_all?(/t/)                        #=> false
puts [1, 2i, 3.14].my_all?(Numeric)                       #=> true
puts [nil, true, 99].my_all?                              #=> false
puts [].my_all?                                           #=> true
puts [1, 2].my_all?(1)                                   #=> false
puts [1, 1].my_all?(1)                                   #=> true
puts ["a", "b"].my_all?("b")                                   #=> false
puts ["a", "a"].my_all?("a")                                   #=> true
puts "- - - -\n"

puts "Test #my_any method"
puts %w[ant bear cat].my_any? { |word| word.length >= 3 } #=> true
puts %w[ant bear cat].my_any? { |word| word.length >= 4 } #=> true
puts %w[ant bear cat].my_any?(/d/) #=> false
puts [nil, true, 99].my_any?(Integer) #=> true
puts [nil, true, 99].my_any? #=> true
puts [].my_any? #=> false
puts [1, 2, 3, 's'].my_any?(String) #=> true
puts [1, 2, 3, 's'].my_any?(Numeric) #=> true
puts [1, 2, 3].my_any?(String) #=> false
puts [1, 2].my_any?(1) # true
puts [1, 1].my_any?(1) # true
puts "- - - -\n"

puts "Test #my_none method"
puts %w[ant bear cat].my_none?(/d/) #=> true
puts %w[ant bear cat].my_none? { |word| word.length == 5 } #=> true
puts %w[ant bear cat].my_none? { |word| word.length >= 4 } #=> false
puts [1, 3.14, 42].my_none?(Float) #=> false
puts [].my_none? #=> true
puts [nil].my_none? #=> true
puts [nil, false].my_none? #=> true
puts [nil, false, true].my_none? #=> false
puts [1, 2, 3].my_none?(1) #=> false
puts [1, 2, 3].my_none?(4) #=> true
puts [nil, false, nil, false].my_none? #true
puts "- - - -\n"

puts "Test #my_count method"
ary = [1, 2, 9, 7, 11, 23, 8,]
puts ary.my_count #=> 4
puts ary.my_count(9) #=> 0
puts ary.my_count(2) #=> 2
puts ary.my_count(&:even?) #=> 3
puts ary.my_count(&:odd?) #=> 1
puts "- - - -\n"
