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
        @state = STATES[0]
    end

    def print_state
        puts @state;
    end
end