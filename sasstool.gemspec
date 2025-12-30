lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sasstool/version'

Gem::Specification.new do |s|
  s.name        = 'sasstool'
  s.version     = Sasstool::VERSION
  s.summary     = 'Sass command line renderer'
  s.description = 'Sass command line renderer with globbing import support'
  s.authors     = ['Danny Ben Shitrit']
  s.email       = 'db@dannyben.com'
  s.files       = Dir['README.md', 'lib/**/*.*']
  s.executables = ['sasstool']
  s.homepage    = 'https://github.com/dannyben/sasstool'
  s.license     = 'MIT'

  s.required_ruby_version = '>= 3.2'

  s.add_dependency 'colsole', '~> 1.0'
  s.add_dependency 'listen', '~> 3.9'
  s.add_dependency 'logger', '~> 1.7'  # required by lietsn
  s.add_dependency 'mister_bin', '~> 0.7'
  s.add_dependency 'sassc', '~> 2.4'

  s.metadata['rubygems_mfa_required'] = 'true'
end
