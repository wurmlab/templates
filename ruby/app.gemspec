Gem::Specification.new do |s|
  # meta
  s.name        = 'app'
  s.version     = '0.0.1'
  s.authors     = ['Author Name']
  s.email       = ['author@email.com']
  s.homepage    = 'https://github.com/wurmlab/app'
  s.license     = 'undefined'

  s.summary     = 'App template'
  s.description = <<DESC
App template. Copy and tweak to your liking.

Rename all occurences of app below with the name of your app!
DESC

  # dependencies
  #s.add_dependency('colorize',    '~> 0.7.5')

  # gem
  s.files         = Dir['lib/**/*']
  s.files         = s.files + ['Gemfile', 'app.gemspec']
  s.files         = s.files + ['README.md']
  s.require_paths = ['lib']
  s.executables   = ['app']
end
