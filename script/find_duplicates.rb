require 'yaml'

easy = YAML.load_file('db/easy_words.yml')['easy']
hard = YAML.load_file('db/hard_words.yml')['hard']

easy.each do |word|
  puts word if hard.include?(word)
end
