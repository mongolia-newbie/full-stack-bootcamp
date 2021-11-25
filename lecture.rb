def strange_sums(array)
  i = 0
  array.each do |arr|
    if array.include?(-arr)
      i += 1
    end
  end
  (i/2).to_i
end

# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0

def pair_product(numbers, product)
  len = numbers.length
  (0...len - 1).each do |start_inx|
    (start_inx + 1..len - 1).each do |end_index|
      if numbers[start_inx] * numbers[end_index] == product
        return true
      end
    end
  end
  false
end

# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

def rampant_repeats(string, hash)
  words = string.split("")
  final_words = ""
  words.each do |word|
    if (hash.keys).include?(word)
      final_words << (word * hash[word])
    else
      final_words << word
    end
  end
  final_words
end 

# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

def perfect_square(number)
  i = 1
  while i <= number
    if i*i == number
      return true
    end
    i += 1
  end
  false
end

# p perfect_square(1)     # true
# p perfect_square(4)     # true
# p perfect_square(64)    # true
# p perfect_square(100)   # true
# p perfect_square(169)   # true
# p perfect_square(2)     # false
# p perfect_square(40)    # false
# p perfect_square(32)    # false
# p perfect_square(50)    # false

def divisor_count(number)
  count = 0
  (1..number).each do |num|
    if number % num == 0
      count += 1
    end
  end
  count
end


def anti_prime?(number)
  (2...number).each do |num|
    if divisor_count(number) <= divisor_count(num)
      return false
    end
  end
  true
end

# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false

def matrix_addition(matrix_1, matrix_2)
  length = matrix_1.length
  width = matrix_1[0].length
  new_matrix = Array.new(length) {Array.new(width)}
  (0...length).each do |i|
    (0...width).each do |j|
      new_matrix[i][j] = matrix_1[i][j] + matrix_2[i][j]
    end
  end
  new_matrix
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def mutual_factors(*num)
  result = []
  (1..num.min).each do |i|
    if num.all? {|el| el % i == 0}
      result << i
    end 
  end
  result
end

# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

def tribonacci_number(num)
  array = [1, 1, 2]
  (3...num).each do |i|
    array[i] = array[i-1] + array[i-2] + array[i-3]
  end
  array[num - 1]
end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274

def matrix_addition_reloaded(*matrices)
  matrix = matrices.first
  h = matrix.length
  w = matrix[0].length
  empty_matrix = Array.new(h) {[0] * w}
  matrices.inject(empty_matrix) do |m1, m2|
    return nil if m1.length != m2.length || m1[0].length != m2[0].length
    matrix_addition(m1, m2)
  end
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

def squarocol?(array)
  return true if array.any? {|el| el.uniq.length == 1}
  return true if array.transpose.any? {|el| el.uniq.length == 1}
  false
end

# p squarocol?([
#     [:a, :x , :d],
#     [:b, :x , :e],
#     [:c, :x , :f],
# ]) # true

# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true

# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false

def squaragonal?(array)
  len = array.length
  temp1 = []
  temp2 = []
  (0...len).each {|i| temp1 << array[i][i]}
  (0...len).each {|j| temp2 << array[j][-1-j]}
  return true if temp1.uniq.length == 1 or temp2.uniq.length == 1
  false
end

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :x, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :o, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) # false

def pascals_triangle(num)
  result = Array.new(num) {|index| [0] * (index + 1)}
  result[0][0] = 1
  result[1][0] = 1
  result[1][1] = 1
  (2..num-1).each do |i|
    (0..i).each do |j|
      if j == 0 || j == i
        result[i][j] = 1
      else
        result[i][j] = result[i-1][j-1] + result[i-1][j]
      end
    end
  end
  result
end

# p pascals_triangle(5)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1]
# # ]

# p pascals_triangle(7)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1],
# #     [1, 5, 10, 10, 5, 1],
# #     [1, 6, 15, 20, 15, 6, 1]
# # ]

def is_prime?(number)
  return false if (2...number).any? {|i| number % i == 0}
  number >= 2
end

def mersenne_prime(n)
  m_hub = []
  x = 0
  count = 0
  while m_hub.length < n
    temp = 2**x - 1
    m_hub << temp if is_prime?(temp)
    x += 1
  end
  m_hub[-1]
end

# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071

def triangular_num?(num)
  (1..num).any? {|n| n*(n+1)/2 == num}
end

def triangular_word?(word)
  alphabet = ("a".."z").to_a
  chars = word.split("")
  word_number = 0
  chars.each do |char|
    word_number += alphabet.index(char) + 1
  end
  triangular_num?(word_number)
end

# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false

def has_adjacent?(array)
  len = array.length
  (0..len-2).any? {|i| array[i] - array[i+1] == 1 || array[i] - array[i+1] == -1}
end

def consecutive_collapse(array)
  while has_adjacent?(array)
    indecis = (0..array.length-2).select {|j| array[j] - array[j+1] == 1 || array[j] - array[j+1] == -1}
    first_cnum = indecis.first
    array = array[0...first_cnum] + array[first_cnum+2..-1]
  end
  array
end

# p consecutive_collapse([3, 4, 1])                     # [1]
# p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
# p consecutive_collapse([9, 8, 2])                     # [2]
# p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
# p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
# p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
# p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
# p consecutive_collapse([13, 11, 12, 12])              # []

def required_prime(start_num, num)
  if num > 0
    temp_num = start_num + 1
    temp_prime = []
    while temp_prime.length < num
      temp_prime << temp_num if is_prime?(temp_num)
      temp_num += 1
    end
    return temp_prime[num - 1]
  else
    temp_num = start_num - 1
    temp_prime = []
    while temp_prime.length < num.abs && temp_num > 0
      temp_prime << temp_num if is_prime?(temp_num)
      temp_num -= 1
    end
    if temp_prime.length == num.abs
      return temp_prime[num.abs - 1]
    else
      return nil
    end
  end
end

def pretentious_primes(array, n)
  array.map {|i| required_prime(i, n)}
end

# p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
# p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
# p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
# p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
# p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
# p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
# p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
# p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
# p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
# p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]