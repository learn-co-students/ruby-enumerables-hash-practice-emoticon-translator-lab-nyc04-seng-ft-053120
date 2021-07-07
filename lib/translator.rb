require 'yaml'
require 'pry'
path='.\lib\emoticons.yml'

def load_library(path)
  emoticons=YAML.load_file(path)
  emoticons_hash={}
  count=0
  while count<emoticons.length do
    emoticons_hash[emoticons.keys[count]]={}
    count+=1
  end
  count=0
  while count<emoticons.length do
    emoticons_hash[emoticons.keys[count]][:english]=emoticons.values[count][0]
    emoticons_hash[emoticons.keys[count]][:japanese]=emoticons.values[count][1]
    count+=1
  end
  emoticons_hash
end

def get_japanese_emoticon(path,emoticon)
  emoticons_hash=load_library(path)
  answer_value="Sorry, that emoticon was not found"
  emoticons_hash.each do |key,value|
    if value[:english].eql?(emoticon)
      answer_value=value[:japanese]
    end
  end
  answer_value
end

def get_english_meaning(path,emoticon)
  emoticons_hash=load_library(path)
  answer_key="Sorry, that emoticon was not found"
  emoticons_hash.each do |key,value|
    if value[:japanese].eql?(emoticon)
      answer_key=key
    end
  end
  answer_key
end
