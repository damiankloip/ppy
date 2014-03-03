require 'minitest/autorun'
require 'minitest/unit'
require 'rainbow'
require_relative '../lib/ppy'

begin
  require 'minitest/pride'
rescue LoadError
end

module PrettyYaml
  class PPYTest < Minitest::Test

    # Tests the indent_string method.
    def test_indent_string
      assert_equal '', PrettyYaml.indent_string
      assert_equal '  ', PrettyYaml.indent_string(1)
      assert_equal '    ', PrettyYaml.indent_string(2)
    end

    # Tests the print method.
    def test_print
      assert_output('', nil) do
        PrettyYaml.print({})
      end

      test_data = {
        :string => 'value',
        :int => 10,
        :array => [:one, :two],
        :hash => { :test => 'one' }
      }

      expected = <<OUT
\e[33mstring\e[0m: value
\e[33mint\e[0m: \e[36m10\e[0m
\e[33marray\e[0m:
  \e[33m-\e[0m one
  \e[33m-\e[0m two
\e[33mhash\e[0m:
  \e[33mtest\e[0m: one
OUT

      assert_output(expected) do
        PrettyYaml.print(test_data)
      end

      test_data_empty = {
        :int => 0,
        :array => [],
        :hash => {},
        :nil => nil
      }

      expected = <<OUT
\e[33mint\e[0m: \e[36m0\e[0m
\e[33marray\e[0m: [ ]
\e[33mhash\e[0m: { }
\e[33mnil\e[0m: \e[34mnil\e[0m
OUT
      assert_output(expected) do
        PrettyYaml.print(test_data_empty)
      end
    end

    # Tests the empty_value method.
    def test_empty_value
      assert_equal '', PrettyYaml.empty_value('')
      assert_equal '{ }', PrettyYaml.empty_value({})
      assert_equal '[ ]', PrettyYaml.empty_value([])
    end

    # Tests the format_value method.
    def test_format_value
      assert_equal 'string', PrettyYaml.format_value('string')
      assert_equal '10'.color(:cyan), PrettyYaml.format_value(10)
      assert_equal '10.11'.color(:cyan), PrettyYaml.format_value(10.11)
      assert_equal 'true'.color(:green), PrettyYaml.format_value(true)
      assert_equal 'false'.color(:red), PrettyYaml.format_value(false)
      assert_equal 'nil'.color(:blue), PrettyYaml.format_value(nil)
    end

  end
end