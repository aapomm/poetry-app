require 'yaml'

file = ARGV[0] || abort("Usage: ruby script/find_duplicates.rb <file>")

data = YAML.load_file(file)
words = data[data.keys.first]

duplicates = words.select { |word| words.count(word) > 1 }.uniq
duplicates.each { |word| puts word }
