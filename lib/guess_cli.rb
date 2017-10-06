module GuessCLI

  def self.request_guess
    puts "Make a guess:"
    print "> "
    guess = gets.chomp.to_i
    puts "Your guess was #{guess}!"
    guess
  end

end

