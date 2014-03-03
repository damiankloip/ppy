# Pretty Print YAML

Provides a CLI executable to pretty print YAML files in colour.

### Install

    gem install ppy

### Examples

    ppy path/to/file.yml

    ppy path/to/file.yml some_key

    ppy path/to/file.yml some_key.some_nested_key

    # Seperator can be specified using -s, --seperator, or PPY_SEPERATOR env var.
    ppy path/to/file.yml some.dot.key/nested.key --seperator=/

