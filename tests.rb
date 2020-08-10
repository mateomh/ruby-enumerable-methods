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