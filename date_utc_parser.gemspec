# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "date_utc_parser/version"

Gem::Specification.new do |s|
  s.name        = "date_utc_parser"
  s.version     = DateUtcParser::VERSION
  s.authors     = ["Matt Simpson"]
  s.email       = ["matt.simpson3@gmail.com"]
  s.homepage    = "http://github.com/ionicmobile/date_utc_parser"
  s.summary     = %q{Make working with UTC Time more fun}
  s.description = %q{Takes an object and returns the equivalent UTC Time object}
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths = ["lib"]
  s.required_ruby_version = "~> 1.9.2"

  s.add_development_dependency "rspec", "2.10.0"
end
