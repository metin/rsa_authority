# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rsa_authority/version'

Gem::Specification.new do |spec|
  spec.name          = "rsa_authority"
  spec.version       = RSAAuthority::VERSION
  spec.authors       = ["Metin Yorulmaz"]
  spec.email         = ["metin@me.com"]
  spec.summary       = %q{Authorize your APIs with RSA key pairs}
  spec.description   = %q{Authorize your APIs with RSA key pairs}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0.0"
end
