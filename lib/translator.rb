require 'pry'
require "yaml"

def load_library(file_path)
  file_path = YAML.load_file('./lib/emoticons.yml')
  new_hash = {}
  file_path.each do |key, value|
    new_hash[key] = {}
    new_hash[key][:english] = file_path[key][0]
    new_hash[key][:japanese] = file_path[key][1]
  end
  new_hash
  # create a result hash; initialize to empty hash
  # iterate over emoticon keys
    #add/update property :english to result_hash ; assign value of emoticons 1st index
    #add/update property :japanese to reslut_hash; assign value of emoticons 2nd index 

  #return result_hash
end

def get_japanese_emoticon(file_path, en_emoticon)
  sorted_library = load_library(file_path)
  sorted_library.each do |key, value|
    if value[:english] == en_emoticon
      return value[:japanese]
    end
  end
  "Sorry, that emoticon was not found"

  
  #import load_library
  #iterate over library 
    #check if the enlighs property of inner_hash is equal to en_emoticon 
      #return japanese property of inner_hash
    #return apology message
  # code goes here
end

def get_english_meaning(file_path, jp_emoticons)
  sorted_library = load_library(file_path)
  sorted_library.each do |key, value|
    if value[:japanese] == jp_emoticons
      return key
  # code goes here
 
  end
end
"Sorry, that emoticon was not found"
end