require 'words_to_number'

RSpec.describe WordsToNumber do
  it 'converts simple numbers' do
    expect(described_class.convert('one')).to eq(1)
    expect(described_class.convert('twenty')).to eq(20)
  end

  it 'converts hundreds' do
    expect(described_class.convert('two hundred forty-six')).to eq(246)
  end

  it 'handles thousands' do
    expect(
      described_class.convert('seven hundred eighty-three thousand nine hundred and nineteen')
    ).to eq(783_919)
  end

  it 'handles million' do
    expect(described_class.convert('one million')).to eq(1_000_000)
  end

  it 'handles zero' do
    expect(described_class.convert('zero')).to eq(0)
  end

  describe 'negative numbers' do
    it 'converts simple negative numbers' do
      expect(described_class.convert('negative one')).to eq(-1)
      expect(described_class.convert('negative twenty')).to eq(-20)
      expect(described_class.convert('negative fifteen')).to eq(-15)
      expect(described_class.convert('minus one')).to eq(-1)
      expect(described_class.convert('minus twenty')).to eq(-20)
      expect(described_class.convert('minus fifteen')).to eq(-15)
    end

    it 'converts negative hundreds' do
      expect(described_class.convert('negative two hundred')).to eq(-200)
      expect(described_class.convert('negative five hundred thirty-four')).to eq(-534)
    end

    it 'converts negative thousands' do
      expect(described_class.convert('negative one thousand')).to eq(-1_000)
      expect(described_class.convert('negative seven hundred eighty-three thousand nine hundred and nineteen')).to eq(-783_919)
    end

    it 'converts negative millions' do
      expect(described_class.convert('negative one million')).to eq(-1_000_000)
      expect(described_class.convert('negative two million five hundred thousand')).to eq(-2_500_000)
      expect(described_class.convert('negative nine hundred ninety-nine million nine hundred ninety-nine thousand nine hundred ninety-nine')).to eq(-999_999_999)
    end

    it 'converts negative one million' do
      expect(described_class.convert('negative one million')).to eq(-1_000_000)
    end
  end
end
