# require modules here
require "yaml"
def load_library(path)
  new_emoji={}
  YAML.load_file(path).each do |key,value|
  new_emoji[key] = {}
  new_emoji[key][:english] = value[0]
  new_emoji[key][:japanese] = value[1]
 end
 new_emoji
end

 
def get_japanese_emoticon(path,emoticon) 
    sorted_library = load_library(path)
    p sorted_library
    sorted_library.each do | key, value |
     if emoticon == value[:english]
        return value[:japanese]
    end
  end
   return  "Sorry, that emoticon was not found"
end



def get_english_meaning(path,emoticon)
  # code goes here
    sorted_library = load_library(path)
    sorted_library.each do | key, value |
     if emoticon == value[:japanese]
        return key
    end
  end
  return "Sorry, that emoticon was not found"
end