# WordsToNumber

A Ruby gem that converts numbers written in English words into integers. Supports numbers from 0 up to 1,000,000 (positive and negative).

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add words_to_number
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install words_to_number
```

## Usage

```ruby
require 'words_to_number'

# Simple numbers
WordsToNumber.convert("one")           # => 1
WordsToNumber.convert("twenty")       # => 20
WordsToNumber.convert("fifteen")       # => 15

# Hundreds
WordsToNumber.convert("two hundred")                        # => 200
WordsToNumber.convert("two hundred forty-six")              # => 246

# Thousands
WordsToNumber.convert("one thousand")                                          # => 1_000
WordsToNumber.convert("seven hundred eighty-three thousand nine hundred nineteen") # => 783_919

# Millions
WordsToNumber.convert("one million")                # => 1_000_000
WordsToNumber.convert("two million five hundred thousand")  # => 2_500_000

# Negative numbers
WordsToNumber.convert("negative one")               # => -1
WordsToNumber.convert("minus two hundred")           # => -200
WordsToNumber.convert("negative one million")        # => -1_000_000

# Zero
WordsToNumber.convert("zero")                       # => 0
```

### Supported Number Words

| Category | Words |
|----------|-------|
| Units | zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen |
| Tens | twenty, thirty, forty, fifty, sixty, seventy, eighty, ninety |
| Multipliers | hundred, thousand, million |
| Negative prefixes | negative, minus |

### Hyphenated Numbers

Numbers with hyphens (e.g., "twenty-one") are automatically handled:

```ruby
WordsToNumber.convert("twenty-one")       # => 21
WordsToNumber.convert("ninety-nine")       # => 99
WordsToNumber.convert("negative forty-two") # => -42
```

### "And" Handling

The word "and" is ignored, making British English style numbers work:

```ruby
WordsToNumber.convert("one hundred and twenty-three")  # => 123
```

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `bundle exec rspec` to run the tests.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mistrikushal/words_to_number.

## License

The gem is available as open source under the terms of the [MIT License](LICENSE.txt).
