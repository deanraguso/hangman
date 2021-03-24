#Session file, holds the session class
require './state.rb'
require './word.rb'

class Session
    attr_reader :state
    def initialize 
        @state = State.new
        start_session
        # conclude_session
    end

    # The actual game loop
    def start_session
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