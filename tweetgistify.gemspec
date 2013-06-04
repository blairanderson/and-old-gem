# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tweetgistify/version'

Gem::Specification.new do |spec|
  spec.name          = "tweetgistify"
  spec.version       = Tweetgistify::VERSION
  spec.authors       = ["Blair Anderson"]
  spec.email         = ["blair81@gmail.com"]
  spec.description   = %q{This is an API wrapper for http://tweetgists.herokuapp.com/. With an API Key from the website, you can easily create posts and fetch your posts.}
  spec.summary       = %q{create an instance with your API key, then send posts.}
  spec.homepage      = "http://tweetgists.herokuapp.com/rubygem"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
