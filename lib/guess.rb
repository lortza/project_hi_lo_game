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