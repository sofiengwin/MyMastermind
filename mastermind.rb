#Main file for mastermind game will contain the main game inplementaion logic
class Message
    def self.welcome
        %q{Would you like to (p)lay, read the (i)nstructions,
          read a little (b)ackground on MasterMind or (q)uit?}
    end

    def self.choose_level
    puts  %q{To start the game select a level you like to play

        Enter 1 for Beginner
        Enter 2 for Intermediate
        Enter 3 for Advanced}
         p Message.enter_name

         if user_level = 1
           p Message.enter_name
         else
           p Message.enter_name
         end
    end

    def sequence_generated_message
      puts %q{A sequence has been generated for you try to match them by addiing
      your guesses below}
    end

    def self.show_background
        %q{This MasterMind game is a great game and you will never
        defeat me}
    end

    def self.enter_name
      puts %q{Please add you name to proceed}
      user_name = gets.chomp


    end

    def self.good_bye
      "this is a test"
    end

    def self.is_invalid
    puts  %q{Your entry is invalid. Please folow the instructions
      provided to fully enjoy the game}
    end

end

class Game
    def welcome_message
    p  Message.welcome
    userchoice = gets.chomp
          case userchoice
          when /^p/
          p  Message.choose_level
          when "b"
          p  Message.show_background
          when "q"
          p  Message.good_bye
          else
          p  Message.is_invalid
          end
        end

        def start_game

        end
end

class User
  def user_guess
    userchoice = gets.chomp
  end

  def user_input
    userchoice.split
  end
end

class Computer
  attr_reader :code_combination

  def initialize
    @code_combination = code
  end

  def code
    colors = Game::COLORS.shuffle
    generated_code = []
    4.times{ generated_code << colors.pop }
    generated_code
  end
end

test = Game.new
test.start
