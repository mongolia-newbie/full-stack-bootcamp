# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    if !self.empty?
        self.max - self.min 
    else
        return nil
    end
  end

  def average
    if !self.empty?
        self.sum(0.0)/self.length
    else
        return nil
    end
  end

  def median
    if self.empty?
        return nil
    elsif self.length.odd?
        self.sort[(self.length - 1)/2]
    else
        (self.sort[(self.length - 2)/2] + self.sort[(self.length - 2)/2 + 1])/2.0
    end
  end

  def counts
    result = Hash.new(0)
    self.each {|arr| result[arr] = self.count(arr) }
    result
  end

  def my_count(value)
    count = 0
    self.each {|num| count += 1 if num == value }
    count
  end

  def my_index(value)
    if self.include?(value)
        temp = []
        self.each_with_index { |el, i| temp << i if el == value }
        temp.first
    else
        return nil
    end
  end

  def my_uniq
    new_array = []
    self.each do |el|
        if !new_array.include?(el)
            new_array << el
        end
    end
    new_array
  end

  def my_transpose
    dimension = self.length
    new_array = Array.new(dimension) {Array.new([])}
    (0...dimension).each do |row|
        (0...dimension).each do |col|
            new_array[row][col] = self[col][row]
        end
    end
    new_array
  end

end
