# require modules here
require 'pry'
require 'yaml'

def load_library(file_path)
  library = {"get_meaning" => {}, "get_emoticon" => {} }
  YAML.load_file(file_path).each do |emotion, language|
    english, japanese = language
    library["get_emoticon"][english] = japanese
    library["get_meaning"][japanese] = emotion
  end
  library
end


def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  library = load_library(file_path)
  emoji = library["get_emoticon"][emoticon]
  emoji ? emoji : "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  library = load_library(file_path)
  meaning = library["get_meaning"][emoticon]
  meaning ? meaning : "Sorry, that emoticon was not found"
end
