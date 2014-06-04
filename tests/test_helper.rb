$:.unshift(File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib')))

require 'bundler/setup'
require 'minitest'
require 'minitest/unit'
require 'minitest/autorun'

begin
  require 'minitest/pride'
rescue LoadError
end
