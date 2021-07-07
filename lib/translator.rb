# require modules here
require 'pry' 
require "yaml"

def load_library(file_path)
  emoticon_hash = YAML.load_file(file_path)
  new_hash = {}
  emoticon_hash.each do |key, value|
    new_hash[key] = {:english => value[0], :japanese => value[1]}
  end
  new_hash
end 

def get_english_meaning(file_path, japanese_emoticon)
  emoticon_hash = load_library(file_path)
 
  emoticon_hash.each do |english_meaning, inner_hash|
      if inner_hash[:japanese] == japanese_emoticon
        return english_meaning
      end 
    end 
    "Sorry, that emoticon was not found"
end 

def get_japanese_emoticon(file_path, english_emoticon)
  emoticon_hash = load_library(file_path)
  
  emoticon_hash.each do |english_meaning, inner_hash|
    if inner_hash[:english] == english_emoticon
      return inner_hash[:japanese]
    end 
  end 
  "Sorry, that emoticon was not found"
end 