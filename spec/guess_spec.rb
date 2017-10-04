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

end #BaseGuess


describe CorrectGuess do

end #CorrectGuess


describe HighGuess do

end #HighGuess


describe LowGuess do

end #LowGuess




