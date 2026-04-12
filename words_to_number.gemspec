# frozen_string_literal: true

require_relative "lib/words_to_number/version"

Gem::Specification.new do |spec|
  spec.name = "words_to_number"
  spec.version = WordsToNumber::VERSION
  spec.license = "MIT"
  spec.authors = ["Kushal Mistry"]
  spec.email = ["kushal_mistry@outlook.com"]

  spec.summary = "Convert numbers written in words to integers"
  spec.description = "Parses English number words into integers up to one million"
  spec.homepage = "https://github.com/mistrikushal/words_to_number"
  spec.required_ruby_version = "3.2"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/mistrikushal/words_to_number"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = Dir["lib/**/*.rb"]
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
