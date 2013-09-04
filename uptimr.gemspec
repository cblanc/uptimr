$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'uptimr/version'

spec = Gem::Specification.new do |s|
  s.name = 'uptimr'
  s.version = Uptimr::VERSION
  s.summary = 'Wrapper for the Uptime'
  s.description = 'Wrapper for the Uptime, a great remote monitoring tool written in node.js. See https://github.com/fzaninotto/uptime'
  s.authors = ['Chris Blanchard']
  s.email = ['cablanchard@gmail.com']
  s.homepage = 'https://github.com/cblanc/uptimr'

  s.add_dependency('httparty')
  s.add_dependency('multi_json', '~> 1.7.9')

  s.add_development_dependency('mocha', '~> 0.14.0')
  s.add_development_dependency('test-unit')
  s.add_development_dependency('shoulda', '~> 3.5.0')
  s.add_development_dependency('rake')

  s.files = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
  s.require_paths = ['lib']
  s.licenses = ['MIT']
end
