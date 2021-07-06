# require modules here
require 'yaml'

def load_library(file)
  emotes = YAML.load_file("./lib/emoticons.yml")
  table = {}

  emotes.each {|key, array| table[key] = {} 
    table[key] = {
      :english => array[0],
      :japanese => array[1]
    }
  }
  return table
end

def get_japanese_emoticon(file, emote)
  table = load_library(file)
  
  table.each {|key, array| table[key] 
      if table[key][:english] == emote
        return table[key][:japanese]
      end
  }
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emote)
  # code goes here
  table = load_library(file)
  
  table.each {|key, array| table[key] 
      if table[key][:japanese] == emote
        return key
      end
  }
  return "Sorry, that emoticon was not found"
end