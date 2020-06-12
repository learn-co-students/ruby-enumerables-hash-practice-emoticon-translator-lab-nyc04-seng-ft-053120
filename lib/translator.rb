# require modules here
require "yaml"
require 'pry'

def load_library(file_path)
  # code goes here
result = YAML.load_file(file_path)
  hash = { }
  result.each do |feeling, moji|
    hash[feeling] = {english: moji[0], japanese: moji[1] } 
end
hash
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  library = load_library(file_path)
  library.each do | english_meaning, inner_hash|
    if inner_hash[:japanese] == emoticon
      return english_meaning
    end
    end
    "Sorry, that emoticon was not found"
  end



def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  library = load_library(file_path)
  library.each do | english_meaning, inner_hash|
    if emoticon == inner_hash[:english]
      return inner_hash[:japanese]
    end
  end
  "Sorry, that emoticon was not found"
 # binding.pry
end

