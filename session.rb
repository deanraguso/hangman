#Session file, holds the session class
require './state.rb'

class Session
    attr_reader :state
    def initialize 
        @state_rep = State.new
        @state = false
        start
    end

    # The actual game loop
    def start
        @state_rep.print_state
    end



end