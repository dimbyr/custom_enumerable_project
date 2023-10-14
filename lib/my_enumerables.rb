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
    self.each {|x| yield x}
  end
  # Define my_count
  def my_count
    yield self.count
  end
end
