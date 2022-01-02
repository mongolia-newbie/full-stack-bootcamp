class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza", "app", "kevin", "parents"]
  
  def self.random_word 
    DICTIONARY.sample
  end

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end 

  def already_attempted?(char)
    return true if @attempted_chars.include?(char)
    false
  end

  def get_matching_indices(char)
    temp_array = []
    @secret_word.each_char.with_index {|c, i| temp_array << i if c == char}
    temp_array
  end

  def fill_indices(char, array)
    array.each {|i| @guess_word[i] = char}
  end

  def try_guess(char)
    if already_attempted?(char)
      puts "that has already been attempted."
      return false
    else 
      if get_matching_indices(char).length == 0
        @remaining_incorrect_guesses -= 1
      else
        temp_result = get_matching_indices(char)
        fill_indices(char, temp_result)
      end
      @attempted_chars << char
      return true
    end
  end

  def ask_user_for_guess
    puts "Enter a char:"
    user_input = gets.chomp
    try_guess(user_input)
  end

  def win?
    if @guess_word.join == @secret_word
      puts "Yay, YOU WIN!"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "Oops, you LOSE!"
      return true
    else
      return false
    end
  end

  def game_over?
    if win? || lose?
      puts "The secret word is #{@secret_word}."
      return true
    else
      return false
    end
  end

end
