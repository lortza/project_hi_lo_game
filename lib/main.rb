require_relative 'game'

def play_game
  if __FILE__ == $0
    game = Game.new
    game.play
  end
end

play_game