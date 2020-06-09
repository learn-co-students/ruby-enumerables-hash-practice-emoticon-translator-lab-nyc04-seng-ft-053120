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

def get_english_meaning(file_path, emoticon)
  emoticon_hash = load_library(file_path)
  result = nil 
  
  emoticon_hash.map do |key, value|
    if emoticon_hash.has_value?(emoticon)
      result = emoticon_hash[value][0]
      return result
    elsif 
      result == nil 
      return "Sorry, that emoticon was not found"
    end 
  end 
end 


def get_japanese_emoticon(file_path, emoticon)
  emoticon_hash = load_library(file_path)
  message = "Sorry, that emoticon was not found"
  result = nil 
  
  emoticon_hash.map do |key, value|
    if emoticon_hash.value?(emoticon)
      result << emoticon_hash[value][1]
      return result
    elsif 
      result == nil 
      return message 
    end 
  end 
end