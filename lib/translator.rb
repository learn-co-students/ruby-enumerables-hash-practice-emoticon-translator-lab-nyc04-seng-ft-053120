# # require modules here

 require "yaml"
 require 'pry'

def load_library(file_path)
  # code goes here
  emoticon = YAML.load_file(file_path)
  result = {}
  
  emoticon.each do |key, value|
  result[key] = {}
  result[key][:english] = emoticon[key][0]
  result[key][:japanese] = emoticon[key][1]
  end
  #binding.pry
  result
end


def get_japanese_emoticon(file_path, emoticon)
  # code goes here
emoji = load_library(file_path)
 
emoji.each do |key, value|
  if emoji[key][:english] == emoticon 
    return emoji[key][:japanese]
  end
end
"Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
emoji = load_library(file_path)
emoji.each do |key, value|
  if emoji[key][:japanese] == emoticon
    #binding.pry
    return key
  end
end
"Sorry, that emoticon was not found"
end





# def load_library(path)
#   new_library ={}
#   library = YAML.load_file(path)
#   library.each do | emotion , emoticon |
#     new_library[emotion] ={:english => emoticon[0] , :japanese => emoticon[1]}
#     end
#   new_library
# end

# def get_japanese_emoticon(path, emoticon)
#     results = nil
#     sorted_library = load_library(path)
#     sorted_library.each do | key, value |
#     if emoticon == value[:english]
#       #binding.pry
#         return value[:japanese]
#     else 
#         results = "Sorry, that emoticon was not found"
#       end
#     end
#     results
#   # binding.pry
# end

# def get_english_meaning(path,emoticon) 
#     results = nil
#     sorted_library = load_library(path)
#     sorted_library.each do | key, value |
#     if emoticon == value[:japanese]
#       return key
#     else
#       results = "Sorry, that emoticon was not found"
#       #binding.pry
#       end
#     end
#     results
# end













