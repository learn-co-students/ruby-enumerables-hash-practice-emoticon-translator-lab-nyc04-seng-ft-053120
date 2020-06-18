
require "yaml"
require 'pry'

def load_library(file_path)
  emoticon = YAML.load_file(file_path)
  #create a result hash initialize to empty hash
  emoticon_return = {}
  #iterate over emoticons keys
  emoticon.each do |key, value|
  emoticon_return[key]={}
  #add/update property :english to result_hash asssign value of emoticons 1st index
  emoticon_return[key][:english]=emoticon[key][0]
  #add/update property :japanese to result_hash assign value of emoticons 2nd index
  emoticon_return[key][:japanese]=emoticon[key][1]
  end
  emoticon_return
end

def get_english_meaning(file_path, jp_emoticon)
  emoti = load_library(file_path)
    emoti.each {|key, value|
      if emoti[key][:japanese] == jp_emoticon
        return key
      end
      }
      "Sorry, that emoticon was not found"
end


def get_japanese_emoticon(file_path, en_emoticon)
#import library
  emoti = load_library(file_path)
#iterate over library
    emoti.each do |key, value|
  #if english property of inner hash = em_emoticon
    if emoti[key][:english] == en_emoticon
    #return japanese property of inner_hash
      return emoti[key][:japanese]
  end
  #return apogy message
end
"Sorry, that emoticon was not found"
end

