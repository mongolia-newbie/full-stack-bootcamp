def zip(*arrays)
    length = arrays.first.length
    result = Array.new(length) {[]}
    arrays.each.with_index do |arr, inx|
        (0...length).each do |i|
            result[i][inx] = arrays[inx][i]
        end
    end
    result
end

# def zip(*arrays)
#     length = arrays.first.length

#     (0...length).map do |i|
#         arrays.map { |array| array[i] }
#     end
# end


def prizz_proc(array, prc1, prc2)
    temp_array = []
    array.each do |arr|
        temp_array << arr if (prc1.call(arr) && prc2.call(arr)) or !(prc1.call(arr) || prc2.call(arr))
    end
    result = array - temp_array
    result
end

def zany_zip(*arrays)
    max_length = (arrays.map {|arr| arr.length }).max
        
    (0...max_length).map do |i|
        arrays.map {|array| array[i]}
    end
end

def maximum(array, &prc)
    new_array = Hash.new(0)
    array.reverse.each {|arr| new_array[arr] = prc.call(arr)}
    new_array.key(new_array.values.max)
end

def my_group_by(array, &prc)
    result = Hash.new {|h, k| h[k] = [] }
    array.each do |arr|
        result[prc.call(arr)] << arr
    end
    result
end

def max_tie_breaker(array, tie_breaker, &prc)
    return nil if array == []
    max = array.first
    array.each do |arr|
        if prc.call(arr) > prc.call(max)
            max = arr
        elsif (prc.call(arr) == prc.call(max)) && tie_breaker.call(arr) > tie_breaker.call(max)
            max = arr
        end
    end
    max
end


def silly_syllables(sentence)
    vowels = "aeiou"
    new_sentence = []
    sentence.split(" ").each do |word|
        if word.split("").count {|char| vowels.include?(char)} >= 2
            temp_word_split = word.split("")
            start_inx = word.index((temp_word_split.select {|char| vowels.include?(char)}).first )
            end_inx = word.length - word.reverse.index((temp_word_split.reverse.select {|char| vowels.include?(char)}).first ) - 1
            new_sentence << temp_word_split[start_inx..end_inx].join
        else
            new_sentence << word
        end
    end
    new_sentence.join(" ")
end