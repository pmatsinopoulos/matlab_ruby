# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'matlab_ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "matlab_ruby"
  spec.version       = MatlabRuby::VERSION
  spec.authors       = ["Panayotis Matsinopoulos"]
  spec.email         = ["panayotis@matsinopoulos.gr"]

  spec.summary       = "A Ruby interface to MATLAB Engine API."
  spec.description   =<<-SHORT_DESCRIPTION
This gem allows you to build a MATLAB Engine Application, a.k.a. a Ruby application that embeds a MATLAB Engine. This is all done by interfacing the MATLAB Engine API.
You can read more about the MATLAB Engine API here: http://www.mathworks.com/help/matlab/calling-matlab-engine-from-c-c-and-fortran-programs.html.
  SHORT_DESCRIPTION
  spec.homepage      = "https://github.com/pmatsinopoulos"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "dotenv", "2.0.2"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
