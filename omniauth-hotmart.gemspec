# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-hotmart/version'

Gem::Specification.new do |spec|
  spec.name          = 'omniauth-hotmart'
  spec.version       = OmniAuth::Hotmart::VERSION
  spec.authors       = ['Leonardo de Carvalho Santos', 'Joao Paulo Motta Oliveira Silva']
  spec.email         = ['aleotory@gmail.com', 'jpaulo.motta@gmail.com']

  spec.summary       = 'Hotmart authentication strategy for omniauth.'
  spec.description   = "Simply a omniauth provider for Hotmart. Connect your Ruby on Rails application to the Hotmart suite of web applications. It uses OmniAuth/OAuth to connect with Hotmart's hotconnect. "
  spec.homepage      = 'https://github.com/leodcs/omniauth-hotmart'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'omniauth-oauth2', '~> 1.5'
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.5'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'webmock'
end
