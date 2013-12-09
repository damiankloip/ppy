require 'minitest/autorun'
require 'minitest/unit'
require_relative '../lib/ppy/nested_access'

begin
  require 'minitest/pride'
rescue LoadError
end

module PrettyYaml
  class NestedAccessTest < Minitest::Test

    # Tests the indent_string method.
    def test_nested_access
      assert({}.respond_to? :nested_access)

      test_hash = {
        'string' => 'string_value',
        :symbol => 'symbol_value',
        10 => 'numeric_value',
        'nested_array' => ['test'],
        'nested_hash' => { :one => 'test' },
        'nested_hash_deep' => {
          'one' => {
            'two' => 'test',
          }
        }
      }

      assert_equal('string_value', test_hash.nested_access('string'))
      assert_nil(test_hash.nested_access('invalid'))
      assert_equal('symbol_value', test_hash.nested_access(:symbol))
      assert_nil(test_hash.nested_access(:invalid))
      assert_equal('numeric_value', test_hash.nested_access(10))
      assert_nil(test_hash.nested_access(11))
      assert_equal(['test'], test_hash.nested_access('nested_array'))
      assert_equal({:one => 'test'}, test_hash.nested_access('nested_hash'))
      assert_equal('test', test_hash.nested_access('nested_hash.one'))
      assert_nil(test_hash.nested_access('nested_hash.two'))
      assert_equal({'two' => 'test'}, test_hash.nested_access('nested_hash_deep.one'))
      assert_equal('test', test_hash.nested_access('nested_hash_deep.one.two'))
      assert_nil(test_hash.nested_access('nested_hash_deep.one.three'))
    end

  end
end