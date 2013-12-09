require 'rainbow'

module PrettyYaml
  extend self

  # Prints the actual data.
  def print(data, level = 0)
    case data
    when Hash
      data.each do |key, value|
        if value.is_a? Enumerable
          string = "#{indent_string(level)}#{format_key(key)}:"

          if value.empty?
            puts string + ' ' + format_value('{ }')
          else
            puts string
            print(value, level + 1)
          end
        else
          puts "#{indent_string(level)}#{format_key(key)}: #{format_value(value)}"
        end
      end
    when Array
      data.each do |value|
        if value.is_a? Enumerable
          string = format_key "#{indent_string(level)}-"
          if value.empty?
            puts string + ' ' + format_value('[ ]')
          else
            puts string
            print_yaml(value, level + 1)
          end
        else
          puts "#{indent_string(level)}#{format_key('-')} #{format_value(value)}"
        end
      end
    else
      puts "#{indent_string(level)}#{format_value(data)}"
    end
  end

  # creates space indentation for a string, based on a level int.
  def indent_string(level)
    "  " * level
  end

  # Formats the data key.
  def format_key(key)
    key.to_s.color(:yellow)
  end

  # Formats the data value.
  def format_value(value)
    case value
    when Numeric
      value.to_s.color(:cyan)
    when String
      value
    when TrueClass
      value.to_s.color(:green)
    when FalseClass
      value.to_s.color(:red)
    when NilClass
      'nil'.color(:blue)
    else
      value
    end
  end

end
