# -*- encoding: utf-8 -*-
# frozen_string_literal: true

# allows bundler to use the gemspec for dependencies
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'has_integrations/version'

Gem::Specification.new do |s|
  s.name        = 'has_integrations'
  s.version     = HasIntegrations::VERSION
  s.platform    = Gem::Platform::RUBY
  s.license     = 'MIT'
  s.authors     = ['L. Preston Sego III']
  s.email       = 'LPSego3+dev@gmail.com'
  s.homepage    = 'https://github.com/NullVoxPopuli/has_integrations'
  s.summary     = "HasIntegrations-#{HasIntegrations::VERSION}"
  s.description = 'Rails gem for a pattern to manage 3rd party service integrations'

  s.files        = Dir['CHANGELOG.md', 'LICENSE', 'README.md', 'lib/**/*']
  s.require_path = 'lib'

  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  s.required_ruby_version = '>= 2.0'

  s.add_development_dependency 'rake'

  # Quality Control
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'codeclimate-test-reporter'
  s.add_development_dependency 'minitest'

  # Debugging
  s.add_development_dependency 'awesome_print'
  s.add_development_dependency 'pry-byebug'
end
