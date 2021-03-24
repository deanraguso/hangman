require "./states.rb"

class State
    attr_reader :state

    def initialize
        @state_rep = STATES[0]
        @state = 1
        @lives = 7
        @word = "magical"
        @letters_guessed = []
    end

    def print_remaining_word
        print " "
        @word.split('').each do |c|
            if @letters_guessed.include?(c) 
                print c+" "
            else
                print "_ "
            end
        end
        puts()
    end

    def print_state
        print_remaining_word
        puts @state_rep;
    end

    def good_guess(char)
        return @word.include?(char) && !@letters_guessed.include?(char)
    end

    def prompt_input
        puts "You have #{@lives} lives remaining!"
        print "Enter a character: "
        handle_guess_input
    end

    def handle_guess_input
        char = gets.chomp

        if !good_guess(char)
            puts "Not a good guess!"
            @lives -= 1
        end

        # Must go after the call to good_guess
        @letters_guessed << char
    end

    def remaining_letters
        @word.length - @word.split('').select{|c| @letters_guessed.include?(c)}.length
    end

    def update_state
        r = remaining_letters
        if r > 0 && @lives > 0
            #Game is still on!
        elsif r > 0 && @lives <= 0
            #Game loss
            @state = 0
        elsif r ==0
            @state = 2
        else
            Error.new
        end

    end

    def handle_win
        puts "Congratz, the dude lives!"
    end

    def handle_loss
        puts "You have run out of lives, the man is dead!"
    end

end