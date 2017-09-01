class Game
  def initialize
    @range_min = 1
    @range_max = 10
    @max_guesses = 3
    @correct_answer = rand(@range_min..@range_max)
    @guess_count = 0
  end


  def play
    welcome_user

    while remaining_guesses?
      request_guess
      guessed = GuessFactory.create(guess, correct_answer)
      render_loss if lost_game? && !guessed.correct?
      guessed.to_s

      @guess_count += 1
    end
  end

  private

  attr_reader :range_min, :range_max, :max_guesses, :correct_answer, :guess, :guess_count

  def lost_game?
    guess_count == max_guesses - 1
  end

  def welcome_user
    puts "Hey, thanks for playing hi/lo!"
    puts "You have #{max_guesses} guesses to find the number #{range_min}-#{range_max}"
  end

  def request_guess
    puts "Make a guess:"
    print "> "
    @guess = gets.chomp.to_i
    puts "Your guess was #{@guess}!"
  end

  def render_loss
    puts "YOU LOSE! It was actually #{@correct_answer}."
    exit
  end

  def remaining_guesses?
    guess_count < max_guesses
  end
end

module GuessFactory
  def self.create(guess, correct_answer)
    if guess == correct_answer
      CorrectGuess.new(guess)
    elsif guess > correct_answer
      HighGuess.new(guess)
    else
      LowGuess.new(guess)
    end
  end
end

class BaseGuess
  def initialize(value)
    @value = value
  end

  def correct?
    false
  end
  private

  attr_reader :value
end

class CorrectGuess < BaseGuess
  def correct?
    true
  end

  def to_s
    puts "You WIN! It was indeed #{value}!"
  end
end

class HighGuess < BaseGuess
  def to_s
    puts "Go lower..."
  end
end

class LowGuess < BaseGuess
  def to_s
    puts "Go higher..."
  end
end



game = Game.new
game.play


