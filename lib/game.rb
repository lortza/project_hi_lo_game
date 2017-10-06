require_relative 'guess'

class Game

  attr_reader :range_min, :range_max, :max_guesses, :correct_answer, :guess_count

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
      guess = next_guess
      check_guess(guess)
    end
  end

  private

  def next_guess
    guess = GuessFactory.create(correct_answer)
  end

  def check_guess(guess)
    lost_game! if lost_game? && !guess.correct?
    won_game! if guess.correct?

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

  def lost_game!
    puts "YOU LOSE! It was actually #{@correct_answer}."
    exit
  end

  def won_game!
    puts "YOU WIN! It was indeed #{@correct_answer}!"
    exit
  end

  def remaining_guesses?
    guess_count < max_guesses
  end
end