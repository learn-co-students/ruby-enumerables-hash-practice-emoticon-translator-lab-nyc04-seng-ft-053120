require 'pry'
require 'yaml' # require modules here

def load_library(file_name)
emoticons = YAML.load_file(file_name)
new_hash = {}
#binding.pry # require modules here
emoticons.each do |key, value|
  new_hash[key] = {
    :english => value[0],
    :japanese => value[1]
  }
end
  new_hash
end

def get_japanese_emoticon(file_name, emoticon)
  emoticons = load_library(file_name)
  emoticons.each do |key, value|
    if value[:english] == emoticon
      return emoticons[key][:japanese]
      binding.pry
    end
  end
    #binding.pry
    #binding.pry
    "Sorry, that emoticon was not found"
    #go over each key and assign the japanese value to the english name.
    #japanese value == english name
end

def get_english_meaning(file_name, emoticon)
  emoticons = load_library(file_name)
  emoticons.each do |key, value|
    if value[:japanese] == emoticon
      return key
      end
    end
    #binding.pry
    #emoticon = emo_sym[:japanese]
  #  binding.pry
    #binding.pry
    "Sorry, that emoticon was not found"
end
