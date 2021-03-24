#Session file, holds the session class
require './state.rb'
require './word.rb'

$LIFE_MULTIPLIER = 1.5

class Session
    attr_reader :state
    def initialize
        @state = State.new
        @word_object = Word.new #Word is stored in @state
        start_session
        @win = 0 #1 if win, 0 if loss
    end

    def print_current_options
        puts "You are currently on #{@word_object.mode} mode, with a preferred word length of #{@word.length}."
    end

    def print_session_menu
        system "clear"
        puts "Enter o for options, just ENTER to start!"
        handle_session_menu
    end

    def sync_state_and_word
        @state.word = @word_object.return_word
        @state.lives = (@state.word.length * $LIFE_MULTIPLIER).to_i
    end

    def handle_session_menu
        user_input = gets.chomp
        
        if user_input == 'o' || user_input == 'O'
            #Send to Word options
            @word_object.set_mode
        else
            #Proceed"
        end

        sync_state_and_word
    end

    # The actual game loop
    def start_session
        print_session_menu

        while (@state.state == 1)
            @state.print_state
            @state.prompt_input
            @state.update_state
        end

        if (@state.state == 0) 
            @state.handle_loss
        else 
            @state.handle_win
            @win = 1
        end
    end

end