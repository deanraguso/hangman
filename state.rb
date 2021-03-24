#Holds the Hangman states.
STATES = [
"   +---+
    |   |
        |
        |
        |
        |
  =========",
  '
  +---+
  |   |
  O   |
      |
      |
      |
=========',
'
  +---+
  |   |
  O   |
  |   |
      |
      |
=========',
'
  +---+
  |   |
  O   |
 /|   |
      |
      |
=========',
'
  +---+
  |   |
  O   |
 /|\  |
      |
      |
=========',
'
  +---+
  |   |
  O   |
 /|\  |
 /    |
      |
=========',
'
  +---+
  |   |
  O   |
 /|\  |
 / \  |
      |
========='
]

class State
    def initialize
        @state_rep = STATES[0]
        @state = 1
        @lives = 7
    end

    def print_state
        puts @state_rep;
    end

    def wrong_answer
        @lives -= @lives
        puts "You have #{@lives} lives remaining!"
    end

    def check_state
        if @state == 1
            #Game is currently in progress
        elsif @state == 2
            handle_win
        else
            #Game is lost
            handle_loss
        end
    end

    def handle_win
        puts "Congratz, the dude lives!"
    end

    def handle_loss
        puts "You have run out of lives, the man is dead!"
    end

end