# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mazemap/version'

Gem::Specification.new do |spec|
  spec.authors     = ["Evgenii Shevchenko"]

  spec.name        = 'mazemap'
  spec.version     = '0.0.1'
  spec.date        = '2016-12-16'
  spec.summary     = 'MazeMap Graph Pathfinder'
  spec.description = 'Runs Wavefront algorithm to find the shortest path from A to B'
  spec.homepage    = 'https://github.com/leafmind/mazemap'
  
  spec.email       = 'leafmind@gmail.com'

  spec.files       = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.executables = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.test_files  = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.version     = Mazemap::VERSION

  spec.license     = 'MIT'

  spec.add_dependency 'nmatrix'

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 11.3"
  spec.add_development_dependency "rspec", "~> 3.5"
  spec.add_development_dependency "yard", "~> 0.9"
  spec.add_development_dependency "shoulda-matchers"
  spec.add_development_dependency "awesome_print"
end