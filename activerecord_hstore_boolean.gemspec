# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activerecord_hstore_boolean/version'

Gem::Specification.new do |spec|
  spec.name          = 'activerecord_hstore_boolean'
  spec.version       = ActiverecordHstoreBoolean::VERSION
  spec.authors       = ['Meck']
  spec.email         = ['yesmeck@gmail.com']
  spec.summary       = %q{Store boolean in hstore}
  spec.description   = %q{A activerecord extesion allow you use boolean in hstore}
  spec.homepage      = 'https://github.com/yesmeck/activerecord_hstore_boolean'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'activerecord', '~> 4.0.0'
  spec.add_dependency 'activesupport', '~> 4.0.0'

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'pg'
  spec.add_development_dependency 'rspec'
end
