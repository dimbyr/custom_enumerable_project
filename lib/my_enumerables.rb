module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array

  # Define my_each here
  def my_each
    self.each {|element| yield element}
  end

  # Define my_count
  def my_count
    count = 0
    if block_given?
      self.my_each {|x| count += 1 if yield x} 
    else
      count = self.length
    end
    count
  end

  def my_each_with_index
    i = 0
    self.each do |x|
      yield x, i
      i += 1
    end
  end
end
