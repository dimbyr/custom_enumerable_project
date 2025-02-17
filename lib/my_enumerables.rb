module Enumerable
  # Your code goes here
  def my_count
    count = 0
    if block_given?
      my_each {|x| count += 1 if yield x}
    else
      count = length
    end
    count
  end

  def my_each_with_index
    i = 0
    my_each do |x|
      yield x, i
      i += 1
    end
  end

  def my_select
    selected = []
    my_each { |x| selected << x if yield x}
    selected
  end

  def my_all?
    count = 0
    my_each { |x| count += 1 if yield x}
    count == my_count
  end

  def my_none?
    count = 0
    my_each { |x| count += 1 if yield x}
    count.zero?
  end

  def my_any?
    count = 0
    my_each { |x| count += 1 if yield x}
    !count.zero?
  end

  def my_map(&block)
    mapped = []
    my_each { |x| mapped << block.call(x)}
    mapped
  end

  def my_inject(initial_value)
    res = initial_value
    my_each do |x|
      res = yield(initial_value, x)
      initial_value = res
    end
    res
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each(&block)
    each { |element| block.call(element)}
  end
  include Enumerable
end
