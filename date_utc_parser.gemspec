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
  s.files = Dir.glob("lib/**/*") + %w(LICENSE README.md)
  s.test_files = Dir.glob('spec/**/*.rb')
  s.license = "MIT"
  s.require_paths = ["lib"]
  s.required_ruby_version = "~> 1.9.2"

  s.add_dependency "active_support", "~> 3.0"
  s.add_development_dependency "rspec", "2.10.0"
  s.add_development_dependency('rake', '~> 0.9')
  s.add_development_dependency "debugger", "~> 1.2"
  s.add_development_dependency "tzinfo"
end
