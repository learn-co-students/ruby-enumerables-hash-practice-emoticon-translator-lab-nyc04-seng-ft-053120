# require modules here
require "yaml"

def load_library(file_path)
  emoticon_hash = YAML.load_file('./lib/emoticons.yml')
  
  emoticon_hash.each
  
  [:foo, :bar, :jazz].inject({}) do |hash, item|
  hash[item] = item.to_s.upcase
  hash
end
 => {:foo=>"FOO", :bar=>"BAR", :jazz=>"JAZZ"}
  
end 
=begin 
  new_hash = { "get_language" => {}, "get_emoticon"  => {}}
  
  
  emoticon_hash.each do |key, value|
    new_hash["get_language"][value[1]] = key 
    new_hash ["get_emoticon"][value[0]] = value[1]
  end 
  new_hash
=end 




def get_japanese_emoticon
  # code goes here
end

def get_english_meaning
  # code goes here
end