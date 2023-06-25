# frozen_string_literal: true

module Enumerable
  def my_all?
    my_each { |item| return false unless yield(item) }
    true
  end

  def my_any?
    my_each { |item| return true if yield(item) }
    false
  end

  def my_count
    if block_given?
      count = 0
      my_each { |item| count += 1 if yield(item) }
      return count
    end
    size
  end

  def my_each_with_index
    if block_given?
      index = 0
      my_each do |item|
        yield(item, index)
        index += 1
      end
      return self
    end
    size
  end

  def my_inject(initial)
    return unless block_given?

    my_each { |item| initial = yield(initial, item) }
    initial
  end

  def my_map
    return unless block_given?

    result = []
    my_each { |item| result << yield(item) }
    result
  end

  def my_none?
    my_each { |item| return false if yield(item) }
    true
  end

  def my_select
    return unless block_given?

    result = []
    my_each { |item| result << item if yield(item) }
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  # noinspection RubyForLoopInspection
  def my_each
    for item in self
      yield item
    end
  end
end
