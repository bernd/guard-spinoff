# -*- encoding: utf-8 -*-
require File.expand_path('../lib/guard/spinoff/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Bernd Ahlers"]
  gem.email         = ["bernd@tuneafish.de"]
  gem.description   = %q{Guard module for spinoff}
  gem.summary       = %q{Guard module for spinoff}
  gem.homepage      = "https://github.com/bernd/guard-spinoff"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "guard-spinoff"
  gem.require_paths = ["lib"]
  gem.version       = Guard::Spinoff::VERSION

  gem.add_dependency 'guard'
  gem.add_dependency 'spinoff'
end
