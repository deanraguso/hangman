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

        get_word
    end

    def return_word
        return @word
    end

    def print_mode
        puts @mode
    end

    def print_state_summary
        "You are guessing a word in #{@mode} mode, of length #{@length}"
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
            #Just continue!
        end

        system 'clear'
        puts "To change desired word length from #{@length}, press 'l' or just ENTER to continue:"
        change_l = gets.chomp
        if (change_l == 'l' || change_l == 'L')
            set_length
        else 
            #Continue
        end

        print_state_summary
    end

    def set_similar_word
        system "clear"
        puts "Give me a word! (like 'flower', 'power', 'hour')"
        @similar_word = gets.chomp
        puts "Similar word set to '#{@similar_word}'"
        get_word
        sleep 1
    end

    def set_theme
        system "clear"
        puts "Give me one theme word! (like 'blood', 'gore' or 'puppies')"
        @theme = gets.chomp
        puts "Theme word set to '#{@theme}'"
        get_word
        sleep 1
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
        get_word

        sleep 1
    end

    def make_url
        if @mode == "similar_word"
            return "/words?rel_rhy=#{@similar_word}"
        elsif @mode == "theme"
            return "/words?ml=#{@theme}"
        else
            # Defaults to similar word
            puts "Error: Non-matching"
            return "/words?ml=#{@similar_word}"
        end
    end

    def closest_word(words)
        return output = words.map() {|o| o["word"]}.select() { |word| word.length >= @length }
        
        if output.length ==0
            #recurse down to the length that has a word!
            @length -= 1
            return closest_word(words)
        end
    end

    def get_word
        request_query = make_url

        response = Net::HTTP.get("api.datamuse.com", request_query)
        words = JSON.parse(response)

        correct_length_words = closest_word(words)
        r = rand(correct_length_words.length)
        @word = correct_length_words[r]
    end

end

