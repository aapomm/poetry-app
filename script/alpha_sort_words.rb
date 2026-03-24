require 'yaml'

file = ARGV[0] || abort("Usage: ruby script/alpha_sort_words.rb <file>")

data = YAML.load_file(file)
key = data.keys.first
words = data[key].map(&:downcase).sort.uniq
File.open("db/new_#{File.basename(file)}", 'w') { |f| f.write({ key => words }.to_yaml) }
