# require modules here
require "yaml"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  
  emoticons.each do |key, val_arr|
    emoticons[key] = {
      :english => val_arr[0],
      :japanese => val_arr[1]
    }
  end
  
  return emoticons
end

def get_japanese_emoticon(file_path, en_emoticon)
  emoticons_hash = load_library(file_path)
  
  emoticons_hash.each do |key, lang_hash|
    if lang_hash[:english] == en_emoticon
      return lang_hash[:japanese]
    end
  end
  
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, jp_emoticon)
  emoticons_hash = load_library(file_path)
  
  emoticons_hash.each do |key, lang_hash|
    if lang_hash[:japanese] == jp_emoticon
      return key.to_s
    end
  end
  
  return "Sorry, that emoticon was not found"
end

pp get_japanese_emoticon("./lib/emoticons.yml", ":)")
