
module Enumerable
  def my_each(&block)
    # your code here
    #
    self.length().times do |index|
      yield(self[index])
    end
  end

  def my_each_with_index(&block)
    # your code here
    #
    self.length().times do |index|
      yield(self[index], index)
    end
  end
end




