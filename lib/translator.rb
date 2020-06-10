# require modules here
require "yaml"
require 'pry'

def load_library(filepath)
  # code goes here
  library = YAML.load_file(filepath)
  emoticon_hash = {}
  library.each do |meaning, emoticon|
    emoticon_hash[meaning] = {
      english: emoticon[0],
      japanese: emoticon[1]
    }
  end
  emoticon_hash
end

def get_japanese_emoticon(filepath, emoticon)
  # code goes here
  load_library(filepath).each do |meaning, emoticons|
    if emoticons[:english] == emoticon
      return emoticons[:japanese]
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(filepath, emoticon)
  # code goes here
  load_library(filepath).each do |meaning, emoticons|
    if emoticons[:japanese] == emoticon
      return meaning
    end
  end
  "Sorry, that emoticon was not found"
end