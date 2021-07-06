# require modules here
require 'yaml'
require 'pry'
#convert YAML file to a file ruby can interpret
#load_library return a hash where each key is the name of an emoticon
def load_library(file_path)
  file_path = YAML.load_file(file_path)
  new_hash = {}

  file_path.each do |key, value|
  new_hash[key] = {}
  new_hash[key][:english] = file_path[key][0]
  new_hash[key][:japanese] = file_path[key][1]

  end
  new_hash
end

def get_japanese_emoticon(file_path, usa_emoticon)
# Will take a traditional Western emoticon (i.g. :)) and translate it to its Japanese version ((＾ｖ＾)).
# It will also rely load_library to first load the YAML file.
 sorted_library = load_library(file_path) #load library
 sorted_library.each do |key, value|

  if value[:english] == usa_emoticon
    return value[:japanese]
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, jap_emoticons)
  sorted_library = load_library(file_path)
  sorted_library.each do |key, value|
    if value[:japanese] == jap_emoticons
      return key
    end
  end
  "Sorry, that emoticon was not found"
end
