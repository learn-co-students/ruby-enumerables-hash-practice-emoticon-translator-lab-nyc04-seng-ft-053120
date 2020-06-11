# require modules here
require 'pry'
require "yaml"

def load_library(path)
  # code goes here
  hash = {}
  yamlResults = YAML.load_file("./lib/emoticons.yml")
  yamlResults.collect do |entry|
    hash[entry[0]] = {}
    hash[entry[0]][:english] = entry[1][0]
    hash[entry[0]][:japanese] = entry[1][1]
    # binding.pry
  end
  hash
end

def get_japanese_emoticon(path, emoticon_english)
  hash = load_library(path)
  entry_match = hash.find do |entry| #entry is array 0: meaning, 1: hash {english,japanese keys}
    entry[1][:english] == emoticon_english
  end
  # binding.pry
  meaning = (entry_match != nil) ? entry_match[1][:japanese] : "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon_japanese)
  hash = load_library(path)
  entry_match = hash.find do |entry| #entry is array 0: meaning, 1: hash {english,japanese keys}
    entry[1][:japanese] == emoticon_japanese
  end
  # binding.pry
  meaning = (entry_match != nil) ? entry_match[0] : "Sorry, that emoticon was not found"
end