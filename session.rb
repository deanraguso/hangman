#Session file, holds the session class
require './state.rb'

class Session
    attr_reader :state
    def initialize 
        @state = State.new
        start
    end

    # The actual game loop
    def start
        @state.print_state
    end



end