require 'pry'
require 'yaml'

def load_library(yaml)
   new_library ={}
   library = YAML.load_file(yaml)
   library.each do | emotion , emoticon |
    new_library[emotion] ={:english => emoticon[0] , :japanese => emoticon[1]}
    end
  new_library
end

def get_english_meaning(yaml,emoticon)
  results = ""
  library = load_library(yaml)
  library.each do | emo_meaning , languages |
    emoticon ==  languages[:japanese] ? (return emo_meaning) : (results = "Sorry, that emoticon was not found")
  end
  results
end

def get_japanese_emoticon(yaml,emoticon)
  results = ""
  library = load_library(yaml)
  library.each do | emo_meaning , languages | 
    emoticon == languages[:english] ?  (return languages[:japanese]) : (results = "Sorry, that emoticon was not found")
  end
  results
end


