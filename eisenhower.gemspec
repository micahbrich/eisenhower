# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "eisenhower/version"
require 'rubygems'

Gem::Specification.new do |s|
  s.name        = "eisenhower"
  s.version     = Eisenhower::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["micah rich"]
  s.email       = ["micah@micahrich.com"]
  s.homepage    = "http://micahrich.com/eisenhower"
  s.summary     = %q{A ruby wrapper for the Interstate API.}
  s.description = %q{A ruby wrapper for the Interstate API. It's still unfinished, a bit slow, and read-only.}

  s.rubyforge_project = "eisenhower"
  s.required_rubygems_version = ">= 1.3.6"

    s.add_dependency("httparty", "~> 0.7.4")


  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
