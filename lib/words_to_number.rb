# frozen_string_literal: true

require_relative "words_to_number/version"
require_relative "words_to_number/parser"

module WordsToNumber
  class Error < StandardError; end
  def self.convert(str)
    Parser.new(str).call
  end
end
