require_relative 'game'

def play_game(game = Game.new)
  if __FILE__ == $0
    game.play
  end
end

play_game