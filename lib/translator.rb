# require modules here
require 'yaml'

def load_library(file_path)
  # code goes here
  
  emoticon = YAML.load_file(file_path)
  emoticon_return= {}
  emoticon.each do |name,value|
    emoticon_return[name]={}
    emoticon_return[name][:english]=emoticon[name][0]
    emoticon_return[name][:japanese]=emoticon[name][1]
  end
  emoticon_return
end

def get_japanese_emoticon(file_path,emoticon)
  emoji=load_library(file_path)
  emoji.each do |key,value|
  if emoji[key][:english] == emoticon
    return emoji[key][:japanese]
  end
end
"Sorry, that emoticon was not found"
end

def get_english_meaning(file_path,emoticon)
  emoji=load_library(file_path)
  my_value=""
  emoji.each {|key,value|
    if emoji[key][:japanese]==emoticon
    return key
    end
  }
  "Sorry, that emoticon was not found"
end
