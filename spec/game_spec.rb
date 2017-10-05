require 'game'

describe Game do
  let(:game) { Game.new }
  let(:acceptable_range) { (game.range_min..game.range_max).to_a }
  let(:correct_answer) { 2 }

  describe '#initialize' do
    it 'has an instance of Game' do
      expect(game).to be_a(Game)
    end

    it "has a range min that's greater than 0" do
      expect(game.range_min).to be > 0
    end

    it "has a range max that's greater than 1" do
      expect(game.range_max).to be > 1
    end

    it "has a max number of guesses that's greater than 0" do
      expect(game.max_guesses).to be > 0
    end

    it "has a correct answer that's between the range min and max values" do
      expect(acceptable_range.include?(game.correct_answer)).to be(true)
    end

    it 'has a guess count placeholder set at 0' do
      expect(game.guess_count).to eq(0)
    end
  end

  describe '#play' do
    it 'initiates game play'
  end

  describe '#lost_game?' do
    subject { game.send(:lost_game?) }
    context 'when the user has remaining guesses' do
      it('returns false') { expect(subject).to eq(false) }
    end
  end

  describe '#render_loss' do
    it 'ends the game when guesses are exceeded'
  end

  describe '#remaining_guesses?' do
    subject { game.send(:remaining_guesses?) }
    it('returns true if there are remaining guesses') { expect(subject).to eq(true) }
    it 'returns false if there are no remaining guesses'
  end

end #Game