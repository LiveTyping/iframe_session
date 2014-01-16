# -*- encoding: utf-8 -*-
require File.expand_path('../lib/iframe_session/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'iframe_session'
  s.version     = IframeSession::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Andrey Krivko']
  s.email       = %w(jastkand@gmail.com)
  s.homepage    = 'http://github.com/LiveTyping/iframe_session'
  s.summary     = %q{IFrame Session is a gem that allows problematic web browsers (Internet Explorer and Safari) to use same cookies in iframes as in parent windows.}
  s.description = s.summary

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- spec/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'rails'
  s.add_dependency 'useragent'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'bundler'
end
