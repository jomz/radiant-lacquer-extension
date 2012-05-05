# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "radiant-lacquer-extension"

Gem::Specification.new do |s|
  s.name        = "radiant-lacquer-extension"
  s.version     = RadiantLacquerExtension::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = RadiantLacquerExtension::AUTHORS
  s.email       = RadiantLacquerExtension::EMAIL
  s.homepage    = RadiantLacquerExtension::URL
  s.summary     = RadiantLacquerExtension::SUMMARY
  s.description = RadiantLacquerExtension::DESCRIPTION

  s.add_dependency "lacquer", "= 0.5.5"
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.1")

  ignores = if File.exist?('.gitignore')
    File.read('.gitignore').split("\n").inject([]) {|a,p| a + Dir[p] }
  else
    []
  end
  s.files         = Dir['**/*'] - ignores
  s.test_files    = Dir['test/**/*','spec/**/*','features/**/*'] - ignores
  # s.executables   = Dir['bin/*'] - ignores
  s.require_paths = ["lib"]
end
