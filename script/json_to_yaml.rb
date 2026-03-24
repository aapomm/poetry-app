require 'yaml'
require 'json'

files = ARGV.any? ? ARGV : Dir["./sample_files/*"]
files.each do |file|
  easy = []
  hard = []

  json = File.read(file)
  JSON.parse(json)['game_data'].each do |data|
    easy << data['1'].downcase
    hard << data['3'].downcase
  end

  File.open("#{File.basename(file, '.json')}.yaml", 'w') { |file| file.write({ 'easy' => easy, 'hard' => hard }.to_yaml ) }
end
