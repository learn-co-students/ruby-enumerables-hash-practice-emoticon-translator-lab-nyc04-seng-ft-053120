require "yaml"
require "pry"

def load_library(file_path)
  emoticons_hash = YAML.load_file(file_path)
  emoticons_hash.each { |name, array_of_emoticons|
    emoticons_hash[name] = {}
    array_of_emoticons.each { |emoticon|
      emoticons_hash[name].merge!(english: array_of_emoticons[0])
      emoticons_hash[name].merge!(japanese: array_of_emoticons[1])
    }
  }
  emoticons_hash
end

def get_japanese_emoticon(file_path, english_emoticon)
  emoticons_hash = load_library(file_path)
  
  japanese_emoticon = ""

  emoticons_hash.each { |name, languages_hash|
    languages_hash.each { |language, emoticon|
      if emoticon == english_emoticon
        japanese_emoticon = emoticons_hash[name][:japanese]
      end
    }
  }

  if japanese_emoticon != ""
    japanese_emoticon
  else  
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, japanese_emoticon)
  emoticons_hash = load_library(file_path)
  meaning = ""
  emoticons_hash.each { |name, languages_hash|
    languages_hash.each { |language, emoticon|
      if language == :japanese && emoticon == japanese_emoticon
        meaning = name
      end
    }
  }
  if meaning != ""
    meaning
  else
    "Sorry, that emoticon was not found"
  end
end