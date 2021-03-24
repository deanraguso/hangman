#Class for generating random and themed words
require 'net/http'
require 'json'

class Word
    def initialize
        @word = "gothic"
        @theme = "goth"
        @similar_word = "blood"
        @length = 5
        @mode = "similar_word"
    end

    def return_word
        return @word
    end

    def print_mode
        puts @mode
    end

    def set_mode
        system 'clear'
        puts "To change mode: 's': similar word / 't':theme / anything else to continue:"

        mode = gets.chomp

        case mode
        when "s","S"
            @mode = "similar_word"
            puts "Mode set to similar words!"
            set_similar_word
        when "t","T"
            puts "Mode set to theme"
            @mode = "theme"
            set_theme
        else
            Error.new
        end
    end

    def set_similar_word
        system "clear"
        puts "Give me a word! (like 'flower', 'power', 'hour')"
        @similar_word = gets.chomp
        puts "Similar word set to '#{@similar_word}'"
    end

    def set_theme
        system "clear"
        puts "Give me one theme word! (like 'blood', 'gore' or 'puppies')"
        @similar_word = gets.chomp
        puts "Theme word set to '#{@theme}'"
    end

    def set_length
        system 'clear'
        puts "Enter the size of word you'd prefer:"
        len = gets.chomp

        if len.length == 0
            puts "Sticking with previous of #{@length} characters."
            return
        else
            @length = len.to_i
        end

        puts "#{len} characters set as preference!"
    end

end

word = Word.new
word.set_mode

response = Net::HTTP.get("api.datamuse.com", "/words?ml=duck&sp=b*")
words = JSON.parse(response)
r = rand(words.length)
puts words[r]["word"]