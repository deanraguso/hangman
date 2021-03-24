require "./session.rb"
require "./ascii_art.rb"
# Main Game Class File

class Game 

    def initialize
        print_startup_text
        @game_count = 1
        @wins = 0
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
        print_noose
        puts "Welcome to Hangman by Dean"
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
            system("clear")
            print_score
            sleep 1
            session = Session.new
            @game_count += 1

            @wins += session.win
        end
    end

    def print_score
        puts "This is your ##{@game_count} game, with #{@wins} wins!"
    end

end

Game.new