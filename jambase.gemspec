# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jambase/version'

Gem::Specification.new do |gem|
  gem.name          = "jambase"
  gem.version       = Jambase::VERSION
  gem.authors       = ["Carl Brasic"]
  gem.email         = ["cbrasic@gmail.com"]
  gem.description   = %q{A wrapper over the jambase API.}
  gem.summary       = %q{A wrapper over the jambase API.}
  gem.homepage      = "http://github.com/brasic/jambase"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_development_dependency "rspec", "~> 2.14.1"
  gem.add_development_dependency "vcr", "~> 2.5.0"
  gem.add_development_dependency "webmock", "~> 1.11.0"
  gem.add_dependency "httparty", "~> 0.11.0"
  gem.add_dependency "activesupport", "~> 4.0.0"
end

