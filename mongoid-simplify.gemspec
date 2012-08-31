# -*- encoding: utf-8 -*-
require File.expand_path('../lib/mongoid-simplify/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Sascha Wessel"]
  gem.email         = ["swessel@gr4yweb.de"]
  gem.description   = %q{makes it simple again to connect to mongodb with mongoid}
  gem.summary       = %q{makes it simple again to connect to mongodb with mongoid}
  gem.homepage      = "http://github.com/gr4y/mongoid-simplify"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "mongoid-simplify"
  gem.require_paths = ["lib"]
  gem.version       = Mongoid::Simplify::VERSION

  # development
  gem.add_development_dependency "yard", "~> 0.8.2.1"
  gem.add_development_dependency "minitest", "~> 3.3.0"
  gem.add_development_dependency "redcarpet"

  # runtime
  gem.add_dependency "mongoid", "~> 3.0.5"

end
