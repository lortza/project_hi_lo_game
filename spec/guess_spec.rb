require 'guess'

describe GuessFactory do
  describe '.create' do
    let(:correct_answer) { 2 }

    subject { GuessFactory.create(guess, correct_answer) }

    describe 'when the guess is correct' do
      let(:guess) { 2 }
      it('generates a CorrectGuess') { expect(subject.class).to eq(CorrectGuess) }
    end

    describe 'when the guess is too high' do
      let(:guess) { 3 }
      it('generates a HighGuess') { expect(subject.class).to eq(HighGuess) }
    end

    describe 'when the guess is too low' do
      let(:guess) { 1 }
      it('generates a LowGuess') { expect(subject.class).to eq(LowGuess) }
    end
  end
end #GuessFactory


describe BaseGuess do
  let(:input_value) { 'some value' }
  let(:base_guess) { BaseGuess.new(input_value) }

  describe '#initialize' do
    it('has a value') { expect(base_guess.value).to eq(input_value) }
  end

  describe '#correct?' do
    it('returns false') { expect(base_guess.correct?).to eq(false) }
  end
end #BaseGuess


describe CorrectGuess do
  describe '#correct?' do
    it 'returns true'
  end

  describe '#to_s' do
    it "returns 'You WIN!"
  end
end #CorrectGuess


describe HighGuess do
  describe '#to_s' do
    it "returns 'Go lower...'"
  end
end #HighGuess


describe LowGuess do
  describe '#to_s' do
    it "returns 'Go higher...'"
  end
end #LowGuess




