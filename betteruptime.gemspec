# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'betteruptime/version'

Gem::Specification.new do |spec|
  spec.name          = 'betteruptime'
  spec.version       = Betteruptime::VERSION
  spec.authors       = ['guiferrpereira']
  spec.email         = ['guiferrpereira@gmail.com']

  spec.summary       = 'Betteruptime healthcheck helper for a Rails application'
  spec.description   = 'A simple way to configure betteruptime healthcheck for a Rails application'
  spec.homepage      = 'https://github.com/kudocs/betteruptime'
  spec.license       = 'MIT'

  spec.files         = Dir['{app}/**/*', '{lib}/**/*', 'README.md']

  spec.required_ruby_version = '>= 2.7.1'

  spec.add_dependency 'actionpack'
  spec.add_dependency 'railties'
  spec.add_dependency 'sidekiq-scheduler', '>= 4.0.3'
  spec.add_dependency 'sourcify'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'rubocop', '>= 0.74.0'
  spec.add_development_dependency 'rubocop-performance', '>= 1.4.1'
  spec.add_development_dependency 'simplecov', '~> 0.17.1'
  spec.add_development_dependency 'simplecov-console', '>= 0.5.0'
end
