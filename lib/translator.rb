require "pry"
require "yaml"

def load_library(path)
  emoticon_file = YAML.load_file(path)
  new_hash = Hash.new
  emoticon_file.each do |english_meaning, emoji|
    new_hash[english_meaning] = {}
    new_hash[english_meaning][:english] = emoji[0]
    new_hash[english_meaning][:japanese] = emoji[1]
    # binding.pry
  end
  new_hash
end

def get_english_meaning(path, emoticon)
  load_file = load_library(path)
   result = load_file.keys.find do |key, value|
   load_file[key][:japanese] == emoticon
  end
  result ? result : "Sorry, that emoticon was not found"
end

def get_japanese_emoticon(path, emoticon)
  load_file = load_library(path)
  result = load_file.keys.find do |key, value|
    binding.pry
    return load_file[key][:japanese] if load_file[key][:english] == emoticon
  end
  result ? result : "Sorry, that emoticon was not found"
end
