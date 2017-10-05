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
  let(:input_value) { 'some value' }
  let(:correct_guess) { CorrectGuess.new(input_value) }

  describe '#correct?' do
    it('returns true') { expect(correct_guess.correct?).to eq(true) }
  end

  describe '#to_s' do
    before { allow(STDOUT).to receive(:puts).and_return('You WIN!') }
    it("returns 'You WIN!") { expect(correct_guess.to_s).to eq('You WIN!') }
  end
end #CorrectGuess


describe HighGuess do
  let(:input_value) { 'some value' }
  let(:high_guess) { HighGuess.new(input_value) }

  describe '#to_s' do
    before { allow(STDOUT).to receive(:puts).and_return('Go lower') }
    it("returns 'Go lower") { expect(high_guess.to_s).to eq('Go lower') }
  end
end #HighGuess


describe LowGuess do
  let(:input_value) { 'some value' }
  let(:low_guess) { LowGuess.new(input_value) }

  describe '#to_s' do
    before { allow(STDOUT).to receive(:puts).and_return('Go higher') }
    it("returns 'Go higher") { expect(low_guess.to_s).to eq('Go higher') }
  end
end #LowGuess




