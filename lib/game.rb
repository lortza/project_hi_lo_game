require_relative 'guess'

class Game

  attr_reader :range_min, :range_max, :max_guesses, :correct_answer, :guess, :guess_count

  def initialize
    @range_min = 1
    @range_max = 5
    @max_guesses = 3
    @correct_answer = rand(@range_min..@range_max)
    @guess_count = 0
  end

  def play
    welcome_user

    while remaining_guesses?
      offer_guess
    end
  end

  private

  def offer_guess
    request_guess
    guessed = GuessFactory.create(guess, correct_answer)
    render_loss if lost_game? && !guessed.correct?
    guessed.to_s
    @guess_count += 1
  end

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