# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'keyword_struct/version'

Gem::Specification.new do |spec|
  spec.name          = "keyword_struct"
  spec.version       = KeywordStruct::VERSION
  spec.authors       = ["mru2"]
  spec.email         = ["david.ruyer+github@gmail.com"]

  spec.summary       = %q{Read-only struct initialized with mandatory keyword arguments}
  spec.homepage      = "https://github.com/mru2/keyword_struct"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
