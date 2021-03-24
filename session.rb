#Session file, holds the session class
require './state.rb'

class Session
    attr_reader :state
    def initialize 
        @state = State.new
        start_session
        # conclude_session
    end

    # The actual game loop
    def start_session
        loop do
            @state.print_state
            @state.prompt_input
        end
    end
end