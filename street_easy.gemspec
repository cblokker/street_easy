# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'street_easy/version'

Gem::Specification.new do |spec|
  spec.name          = "street_easy"
  spec.version       = StreetEasy::VERSION
  spec.authors       = ["Chase Blokker"]
  spec.email         = ["chaseblokker@yahoo.com"]
  spec.summary       = %q{A ruby wrapper for the street easy API}
  spec.description   = %q{A ruby wrapper for the street easy API}
  spec.homepage      = "https://rubygems.org/gems/street_easy"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "json"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end