def sum_to(n)
    return 1 if n == 1
    return nil if n <= 0
    n + sum_to(n-1)
end

def add_numbers(nums_array)
    return nil if nums_array.length == 0
    return nums_array[0] if nums_array.length == 1
    nums_array[0] + add_numbers(nums_array[1..-1])
end

def gamma_fnc(n)
    return nil if n <= 0
    return 1 if n == 1
    (n - 1) * gamma_fnc(n - 1)
end 

def ice_cream_shop(arr, str)
    return true if str == arr[0] && arr.length == 1
    return false if str != arr[0] && arr.length == 1
    return false if arr.length == 0
    (str == arr[0]) || ice_cream_shop(arr[1..-1], str)
end

# p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
# p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
# p ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
# p ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
# p ice_cream_shop([], 'honey lavender')  # => returns false

def reverse(string)
    return string if string.length <= 1
    string[-1] + reverse(string[0..-2])
end

p    reverse("house") # => "esuoh"
p    reverse("dog") # => "god"
p    reverse("atom") # => "mota"
p    reverse("q") # => "q"
p    reverse("id") # => "di"
p    reverse("") # => ""