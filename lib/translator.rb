# require modules here
require "yaml"
require 'pry'

def load_library(file_path)
  # code goes here
 emoticon = YAML.load_file(file_path)
 hash = {}
 emoticon.each do | feeling, emoji|
    hash[feeling] = {english:emoji[0],japanese:emoji[1]}
  end
 hash
# binding.pry
end
 
 def get_english_meaning(file_path,emoji)
  library = load_library(emoticon)
  library.each do | key, inner_hash|
    if inner_hash[:japanese] == emoji
     return key
    end
   end
  "Sorry, that emoticon was not found"
end
  
 
def get_japanese_emoticon(file_path,emoji)
  library = load_library(emoticon)
  library.each do |key, inner_hash|
    if inner_hash[:english] == emoji
       return library[key][:japanese]
       end
      end
  "Sorry, that emoticon was not found"
  # binding.pry 
end

pp get_japanese_emoticon("./lib/emoticons.yml", ":)")
