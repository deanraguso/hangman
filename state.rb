require "./states.rb"

class State
    attr_reader :state
    attr_accessor :word, :lives

    def initialize
        @state_rep_index = 0
        @state_rep = STATES[0]
        @state = 1
        @lives = 7
        @word = Word.new.return_word
        @letters_guessed = Array.new
    end

    def isalpha(str)
        return false if str.empty?
        !str.match(/[^A-Za-z]/)
    end

    def print_guessed_letters
        print @letters_guessed
    end

    def remaining_word
        output_string = ""
        @word.split('').each do |c|
            if @letters_guessed.include?(c) && isalpha(c)
                output_string << c + " "
            elsif !isalpha(c)
                output_string << c + " "
            else
                output_string << "_ "
            end
        end
        return output_string
    end

    def print_remaining_word
        print " "
        puts(remaining_word)
    end

    def print_state
        system 'clear' 
        print_remaining_word
        puts @state_rep;

        print "Letters you've tried: "
        print_guessed_letters
        puts
    end

    def good_guess(char)
        return @word.include?(char) && !@letters_guessed.include?(char)
    end

    def prompt_input
        puts "You have #{@lives} lives remaining!"
        print "Enter a character: "
        handle_guess_input
    end

    def reduce_life
        @lives -= 1
        @state_rep_index += 1 if @state_rep_index <= 5
        update_state_rep
    end

    def update_state_rep
        @state_rep = STATES[@state_rep_index]
    end

    def handle_guess_input
        char = gets.chomp

        if !good_guess(char)
            puts "Not a good guess!"
            reduce_life
        end

        # Must go after the call to good_guess
        @letters_guessed << char
    end

    def remaining_letters
        @word.length - @word.split('').select() {|l| l != ' ' && l != '-'}.select{|c| @letters_guessed.include?(c)}.length
    end

    def update_state

        r = remaining_word.split('').select(){|c| c == '_'}.length
        if r > 0 && @lives > 0
            #Game is still on!
        elsif r > 0 && @lives <= 0
            #Game loss
            @state = 0
        elsif r == 0
            @state = 2
        else
            Error.new
        end

    end

    def handle_win
        system 'clear'
        puts "Congratz, the dude lives!"
        puts "The word was: '#{@word}'"
        sleep 2
    end

    def handle_loss
        system 'clear'
        puts "You have run out of lives, the man is dead!"
        puts "The word was actually: '#{@word}'"
        sleep 2
    end
    
end