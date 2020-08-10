
module Enumerable
  def my_each(&block)
    # your code here
    #
    self.length().times do |index|
      yield(self[index])
    end
  end
end

my_array = %w[jerry tom dine]


my_array.my_each do |elem|
  puts elem
end
