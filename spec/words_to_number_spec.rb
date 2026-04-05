require "words_to_number"

RSpec.describe WordsToNumber do
  it "converts simple numbers" do
    expect(described_class.convert("one")).to eq(1)
    expect(described_class.convert("twenty")).to eq(20)
  end

  it "converts hundreds" do
    expect(described_class.convert("two hundred forty-six")).to eq(246)
  end

  it "handles thousands" do
    expect(
      described_class.convert("seven hundred eighty-three thousand nine hundred and nineteen")
    ).to eq(783_919)
  end

  it "handles million" do
    expect(described_class.convert("one million")).to eq(1_000_000)
  end

  it "handles zero" do
    expect(described_class.convert("zero")).to eq(0)
  end
end