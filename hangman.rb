require "pry"


class Hangman_game
  attr_reader :guesses_left, :answer
  def initialize
    @guesses_left = 6
    @answer = ("dog").chars
    @guessed_letters = []
    @wrong_letters = []
  end

  def game_over?
    @guesses_left == 0 #|| won?
  end

  def check_guess guessed_answer
    if @answer.include? (guessed_answer)
      puts "That's one."
      @guessed_correct_letter = true
      @guessed_letters.push (guessed_answer)
      puts @guessed_letters
    else
      puts "They're hanging amputees."
      @guessed_correct_letter = false
      @wrong_letters.push (guessed_answer)
      @guesses_left -= 1
      puts "You've used: #{@wrong_letters}."
    end
  end

  # def won?
  #     @guessed_correct_answer
  # end

end



g = Hangman_game.new
puts "Guess a letter to complete the word before he dies."
puts "Your Word"
#g.draw_board

until g.game_over?
  puts "You have #{g.guesses_left} guesses left."
  puts "Guess a letter."
  guess = gets.chomp.downcase
    g.check_guess guess
end

if g.won?
  puts "You're somebody's hero."
end
