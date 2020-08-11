
module Enumerable
  def my_each(&block)
    return self if !block_given?

    self.length().times do |index|
      yield(self[index])
    end
  end

  def my_each_with_index(&block)
    return self if !block_given?

    self.length().times do |index|
      yield(self[index], index)
    end
  end

  def my_select(&block)
    result = []

    return self if !block_given?

    Array(self).my_each do |item|
       next unless yield(item)

       result.push(item)
     end
    
    result
  end

  def my_all?(argument=nil)
    Array(self).my_each do |item|
      if !block_given?
        if argument==nil # no argument passed
          next if item
        else
          if argument.class!=Regexp # When is not a regular expression
            if argument.class==Class 
              next if item.is_a? argument 
            else                    # When it is a value
              next if item==argument
            end
          else
            next if (item=~argument)!=nil
          end 
        end
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
        if argument==nil # no argument passed
          next unless item
        else
          if argument.class!=Regexp # When is not a regular expression
            if argument.class==Class 
              next unless item.is_a? argument
            else                    # When it is a value
              next unless item==argument
            end
          else
            next unless (item=~argument)!=nil
          end   
        end
      else
        next unless yield(item)
      end
      return true
    end
    false
  end

  def my_none?(argument=nil)
    Array(self).my_each do |item|
      if !block_given?
        if argument==nil # no argument passed
          next unless item
        else
          if argument.class!=Regexp # When is not a regular expression
            if argument.class==Class
              next unless item.is_a? argument
            else                    # When it is a value
              next unless item==argument
            end
          else
            next unless (item=~argument)!=nil
          end
        end
      else
        next if !yield(item)
      end
      return false
    end
    true

  end

  def my_count(argument=nil)
    counter = 0
    Array(self).my_each do |item|
      if(!block_given?)
        if argument != nil
          next if item != argument
        else
          return self.length()
        end
        counter += 1
      else
        if yield(item) == true
          counter += 1
        end
      end
    end

    counter
  end

  def my_map
    return self if !block_given?
    aux_ary=[]
    Array(self).my_each do |item|
      aux_ary.push(yield(item))
    end
    aux_ary
  end

end



