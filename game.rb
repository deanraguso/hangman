require "./session.rb"

# Main Game Class File

class Game 

    def initialize
        print_startup_text
        @game_count = 0
        start_game
    end

    # Menu Loop
    def start_game
        loop do
            print_menu
            handle_input
        end
    end

    def print_startup_text
        puts "Welcome to Goth Hangman"
    end

    def print_menu
        puts "Press any key to start a game."
        puts "Press x followed by enter to exit."
    end

    def handle_input
        user_input = gets.chomp()
 
        if user_input == 'x'
            exit
        else 
            # system("clear")
            session = Session.new
            @game_count += @game_count
        end
    end

end