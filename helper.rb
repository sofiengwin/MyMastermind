require 'colorize'
class Message
    def self.welcome
        "Would you like to"+ "(p)lay".green+", read the" +"(i)nstructions".yellow+",
        read a little"+ "(b)ackground".blue+ " on MasterMind or"+ "(q)uit?".red
    end

    def self.choose_level
     %q{To start the game select a level you like to play

        Enter 1 for Beginner
        Enter 2 for Intermediate
        Enter 3 for Advanced}
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
      %q{Please add you name to proceed}
    end

    def self.good_bye
      "this is a test"
    end

    def self.is_invalid
    puts  %q{Your entry is invalid. Please folow the instructions
      provided to fully enjoy the game}
    end

    def  self.generated_sequence
  %q{I have generated a beginner sequence with four elements made up of:
(o)range, (c)yan, (i)ndigo and (r)ed. You are to guess the sequence in which the
se colors appeared e.g OCIR for (o)range, (c)yan, (i)ndigo and (r)ed. Use (q)uit at any time to en
d the game.
Ready to play?
What's your guess?}
  end

end
