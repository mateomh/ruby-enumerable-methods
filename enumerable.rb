# rubocop:disable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity,Metrics/ModuleLength
module Enumerable
  def my_each()
    return self.to_enum unless block_given?

    Array(self).length.times do |index|
      yield(Array(self)[index])
    end
    self
  end

  def my_each_with_index()
    return self.to_enum unless block_given?
    
    Array(self).length.times do |index|
      yield(Array(self)[index], index)
    end
    self
  end

  def my_select()
    result = []

    return self.to_enum unless block_given?

    Array(self).my_each do |item|
      next unless yield(item)

      result.push(item)
    end

    result
  end

  def my_all?(argument = nil)
    Array(self).my_each do |item|
      if !block_given?
        if argument.nil? # no argument passed
          next if item
        elsif argument.class == Class
          next if item.is_a? argument
        elsif (item.is_a? Numeric) || (item.is_a? String) # When it is a value
          next if item == argument
        elsif (argument.class == Regexp) && !(item =~ argument).nil?
          next
        end
      elsif yield(item)
        next
      end
      return false
    end
    true
  end

  def my_any?(argument = nil)
    Array(self).my_each do |item|
      if !block_given?
        if argument.nil? # no argument passed
          next unless item
        elsif argument.class == Class
          next unless item.is_a? argument
        elsif (item.is_a? Numeric) || (item.is_a? String) # When it is a value
          next unless item == argument
        elsif (argument.class == Regexp) && (item =~ argument).nil?
          next
        end
      else
        next unless yield(item)
      end
      return true
    end
    false
  end

  def my_none?(argument = nil)
    Array(self).my_each do |item|
      if !block_given?
        if argument.nil? # no argument passed
          next unless item
        elsif argument.class == Class
          next unless item.is_a? argument
        elsif (item.is_a? Numeric) || (item.is_a? String)
          next unless item == argument
        elsif (argument.class == Regexp) && (item =~ argument).nil?
          next
        end
      else
        next unless yield(item)
      end
      return false
    end
    true
  end

  def my_count(argument = nil)
    counter = 0
    Array(self).my_each do |item|
      if !block_given?
        return length if argument.nil?
        next if item != argument

        counter += 1
      elsif yield(item) == true
        counter += 1
      end
    end

    counter
  end

  def my_map(argument = nil)
    aux_ary = []

    if argument.class == Proc
      Array(self).my_each do |item|
        aux_ary.push(argument.call(item))
      end
      return aux_ary
    end

    return self unless block_given?

    Array(self).my_each do |item|
      aux_ary.push(yield(item))
    end
    aux_ary
  end

  def my_inject(*arguments)
    skip_flag = false
    acum = Array(self)[0]
    if (arguments[0].class == Symbol) || arguments[0].nil?
      skip_flag = true
    elsif arguments[0].is_a? Numeric
      acum = arguments[0]
    end
    Array(self).my_each_with_index do |item, index|
      next if skip_flag && index.zero?

      if block_given?
        acum = yield(acum, item)
      elsif arguments[0].class == Symbol
        acum = acum.send(arguments[0], item)
      elsif arguments[0].is_a? Numeric
        acum = acum.send(arguments[1], item)
      end
    end
    acum
  end
end

# rubocop:enable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity,Metrics/ModuleLength

def multiply_els(my_arr)
  my_arr.my_inject(:*)
end
