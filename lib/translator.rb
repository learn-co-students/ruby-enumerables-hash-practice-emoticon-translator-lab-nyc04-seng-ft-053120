
# require modules here
require "yaml"
require "pry"



def load_library(file_path)

emoticon = YAML.load_file(file_path)

emoticon_return = {}
emoticon.each{|key,value|
emoticon_return[key] = {}
emoticon_return[key][:english] = emoticon[key][0]
emoticon_return[key][:japanese] = emoticon[key][1]
}

emoticon_return

end



def get_japanese_emoticon(file_path,emoticon)

   emoticons = load_library(file_path)
  
 emoji =  emoticons.values.find{|key| emoticon == key[:english]}
 emoji == nil ? "Sorry, that emoticon was not found" : emoji[:japanese]
end


def get_english_meaning(file_path,emoticon)
   emoticons = load_library(file_path)
emoji =  emoticons.keys.find{|key| emoticon == emoticons[key][:japanese]}
emoji == nil ? "Sorry, that emoticon was not found" : emoji
end


