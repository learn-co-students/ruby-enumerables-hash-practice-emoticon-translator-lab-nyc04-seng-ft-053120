# require modules here
require "pry"
require "yaml"

def load_library(emoti)
  emoti = YAML.load_file('./lib/emoticons.yml')
  # code goes here
  emoti_library = {}
  emoti.each do |mood, array|
    # binding.pry
    # goes through the first layer of one hash of mutiple hashes key is 
      # going through the array now what 
     array.each do |emoticon|
      
          if !emoti_library[mood]
            #  that key value doesnt exit we will create one otherwise
              emoti_library[mood] = {}   
          end
          if array.index(emoticon) % 2 == 0 
              emoti_library[mood][:english] = emoticon
          else 
            emoti_library[mood][:japanese] = emoticon
          end   
     end
  end
    emoti_library 
end




def get_japanese_emoticon(emoti_file, eng_emoti)
  # code goes here
  # accepts an eng emoti searches the data for it and spits out jap emoti
  emoti_library = load_library(emoti_file)
    emoti_library.each do |mood, emoti_hash|
        emoti_hash.each do |language, face|
            if face == eng_emoti
              
              return emoti_library[mood][:japanese]
            end
        end
    end
    p "Sorry, that emoticon was not found"
end

def get_english_meaning(emoti_file, emoticon)
  # code goes here
  emoti_library = load_library(emoti_file)
  # we want to search through the result of load_library for the emoticon(in jap)
  # find the emotion{} and call the english(key) version of it
  emoti_library.each do |mood, emoti_hash|
   
      emoti_hash.each do |language, face|
        
          if face == emoticon
            return mood  
          end
          # if apology goes here will if not found but still runs since loading the library is technically the last thing done
      end   
      
    end
    # p "Sorry, that emoticon was not found"
    p "Sorry, that emoticon was not found"
end

  