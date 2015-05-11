# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'geometry/version'

Gem::Specification.new do |spec|
  spec.name          = "geometry"
  spec.version       = Geometry::VERSION
  spec.authors       = ["Juan Gesino"]
  spec.email         = ["jgesino@educatea.com.ar"]

  spec.summary       = %q{Ruby gem that builds HTML and JavaScript code to show geometry.}
  spec.description   = %q{Ruby gem that builds HTML and JavaScript code to show geometry on the browser.}
  spec.homepage      = "http://www.educatea.com.ar"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
