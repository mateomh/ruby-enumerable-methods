# rubocop:disable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity,Metrics/ModuleLength
module Enumerable
  def my_each()
    return to_enum unless block_given?

    Array(self).length.times do |index|
      yield(Array(self)[index])
    end
    self
  end

  def my_each_with_index()
    return to_enum unless block_given?

    Array(self).length.times do |index|
      yield(Array(self)[index], index)
    end
    self
  end

  def my_select()
    result = []

    return to_enum unless block_given?

    Array(self).my_each do |item|
      next unless yield(item)

      result.push(item)
    end

    result
  end

  def my_all?(argument = nil)
    if argument # check for an argument
      Array(self).my_each do |item|
        return false unless argument === item
      end
    elsif block_given? # check for a block
      Array(self).my_each do |item|
        return false unless yield(item)
      end
    elsif Array(self).include?(nil) || Array(self).include?(false) # if no argument and no block provided
      return false
    end
    true
  end

  def my_any?(argument = nil)
    Array(self).my_each do |item|
      if argument # Argument given
        return true if argument === item
      elsif block_given? # block given
        return true if yield(item)
      elsif item
        return true
      end
    end
    false
  end

  def my_none?(argument = nil)
    Array(self).my_each do |item|
      if argument
        return false if argument === item
      elsif block_given?
        return false if yield(item)
      elsif item
        return false
      end
    end
    true
  end

  def my_count(argument = nil)
    counter = 0
    Array(self).my_each do |item|
      if !block_given?
        return Array(self).length if argument.nil?
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

    return to_enum unless block_given?

    Array(self).my_each do |item|
      aux_ary.push(yield(item))
    end
    aux_ary
  end

  def my_inject(*arguments)
    raise('LocalJumpError.new NO BLOCK OR ARGUMENT GIVEN!') if !block_given? && arguments.empty?

    start = 0
    if arguments[0].is_a? Numeric
      acum = arguments[0]
      sym = arguments[1].to_s
    elsif (arguments[0].is_a? Symbol) || arguments[0].nil?
      acum = Array(self)[0]
      sym = arguments[0].to_s
      start = 1
    end
    (start...Array(self).length).each do |i|
      acum = if block_given?
              yield(acum, Array(self)[i])
            else
              acum.send(sym, Array(self)[i])
            end
    end
    acum
  end
end

# rubocop:enable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity,Metrics/ModuleLength

def multiply_els(my_arr)
  my_arr.my_inject(:*)
end
