
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

  def my_select(&block)
    result = []
    Array(self).my_each do |item|
       next unless yield(item)

       result.push(item)
     end
    
    result
  end

  def my_all?(argument=nil)
    Array(self).my_each do |item|
      if !block_given?
        next unless !item.is_a? argument
      else
        next unless !yield(item)
      end
      return false
    end
    true
  end

  def my_any?(argument=nil)
    Array(self).my_each do |item|
      if !block_given?
        next unless item.is_a? argument
      else
        next unless yield(item)
      end
      return true
    end
    false
  end
  
end




