#Session file, holds the session class
require './state.rb'
require './word.rb'

class Session
    attr_reader :state
    def initialize
        @state = State.new
        @word = Word.new
        start_session
        # conclude_session
    end

    def print_current_options
        puts "You are currently on #{@word.mode} mode, with a preferred word length of #{@word.length}."
    end

    def print_session_menu
        system "clear"
        puts "Enter o for options, just ENTER to start!"
        handle_session_menu
    end

    def handle_session_menu
        user_input = gets.chomp
        
        if user_input == 'o' || user_input == 'O'
            #Send to Word options
            @word.set_mode
        else
            #Proceed"
        end
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
        end
    end

end