require 'main'

describe 'play_game' do

  # let(:game) { Game.new }

  it 'calls #play on game' do
    # game_spy = double('Game')
    game = instance_double("Game")
    expect(game).to receive(:play)
    play_game(game)
    # expect_any_instance_of(Game).to receive(:play)
  end

end