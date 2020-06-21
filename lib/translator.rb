# require modules here
 require 'pry'
 require "yaml"
def load_library (file_path)
  # code goes here
  file = File.read(file_path)
  emoticons = YAML.load(file)
  emoticons.each {|x| print x, " "}
  #binding.pry 
   
  #how to transform emoticons or emoticons.keys into a hash from an array 
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  emoticons = load_library(file_path)
  emoji = emoticons.values.find{|faces| faces[0] == emoticon}
  emoji == nil ? "Sorry, that emoticon was not found" : emoji[1]
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  emoticons = load_library(file_path)
  emoji = emoticons.values.find{|name, faces| faces[1] == emoticon}
  emoji == nil ? "Sorry, that emoticon was not found" : emoji[0]
end