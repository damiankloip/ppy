
Gem::Specification.new do |s|
  s.name = 'ppy'
  s.version = '0.0.3'
  s.date = '2013-12-09'
  s.summary = 'Pretty Print YAML'
  s.description = 'A helper tool to pretty print YAML data.'
  s.authors = ['Damian Lee']
  s.email = 'damiankloip@gmail.com'
  s.files = ['lib/ppy.rb', 'lib/ppy/nested_access.rb']
  s.homepage = 'https://github.com/damiankloip/ppy'
  s.executables << 'ppy'

  s.add_runtime_dependency 'rainbow', '~> 1.1.4'
end
