require 'rake'
require 'rake/testtask'

task :default => [:test]

Rake::TestTask.new do |t|
  t.libs.push ['lib', 'tests']
  t.pattern = 'tests/*_test.rb'
  t.verbose = true
end
