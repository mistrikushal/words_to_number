module WordsToNumber
  class Parser
    UNITS = {
      'zero' => 0, 'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4,
      'five' => 5, 'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9,
      'ten' => 10, 'eleven' => 11, 'twelve' => 12, 'thirteen' => 13,
      'fourteen' => 14, 'fifteen' => 15, 'sixteen' => 16,
      'seventeen' => 17, 'eighteen' => 18, 'nineteen' => 19
    }.freeze

    TENS = {
      'twenty' => 20, 'thirty' => 30, 'forty' => 40,
      'fifty' => 50, 'sixty' => 60, 'seventy' => 70,
      'eighty' => 80, 'ninety' => 90
    }.freeze

    MULTIPLIERS = {
      'hundred' => 100,
      'thousand' => 1_000,
      'million' => 1_000_000
    }.freeze

    def initialize(input)
      @words = normalize(input)
    end

    def call
      negative = false

      if %w[negative minus].include?(@words.first)
        negative = true
        @words = @words[1..]
      end

      total = 0
      current = 0

      @words.each do |word|
        next if word == 'and'

        if UNITS.key?(word)
          current += UNITS[word]
        elsif TENS.key?(word)
          current += TENS[word]
        elsif word == 'hundred'
          current *= 100
        elsif %w[thousand million].include?(word)
          total += current * MULTIPLIERS[word]
          current = 0
        else
          raise ArgumentError, "Invalid word: #{word}"
        end
      end

      result = total + current
      negative ? -result : result
    end

    private

    def normalize(str)
      str.downcase.gsub('-', ' ').split
    end
  end
end
