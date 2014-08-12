Gem::Specification.new do |spec|
  spec.name          = "rubygems-gman"
  spec.version       = "0.0.4"
  spec.authors       = ["Calle Erlandsson"]
  spec.email         = ["calle@thoughtbot.com", "hello@thoughtbot.com"]
  spec.summary       = "Generate and install man pages for installed gems."
  spec.homepage      = "https://github.com/thoughtbot/rubygems-gman"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "rdoc-generator-mdoc", "~> 0.0.4"
end
