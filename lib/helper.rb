require 'colorize'
class Message
    def self.welcome
        "WELCOME TO MasterMind!
        Would you like to"+ "(p)lay".green+", read the" +"(i)nstructions".yellow+",
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

    def self.show_instruction
        %q{Enter a sequence of 4 colors containing the generated colors e.g RYBG or YGRB.
          If you enter fewer than 4 or more than 4 colors, you would receive an error mess
          age}
    end

    def self.show_background
        %q{b
      Just a little background on MASTERMIND Mastermind is a board game with an
      interesting history (or rather a legend?). Some game books report that it was in
      vented in 1971 by Mordecai Meirowitz, an Israeli postmaster and telecommunicatio
      ns expert. After many rejections by leading toy companies, the rights were obtai
      ned by a small British firm, Invicta Plastics Ltd. The firm originally manufactu
      red the game itself, though it has since licensed its manufacture to Hasbro in m
      ost of the world. However, Mastermind is just a clever readaptation of an old si
      milar game called 'Bulls and cows' in English, and 'Numerello' in Italian... Act
      ually, the old British game 'Bulls and cows' was somewhat different from the com
      mercial version. It was played on paper, not on a board... Over 50 million copie
      s later, Mastermind is still marketed today!
      The idea of the game is for one player (the code-breaker) to guess the sec
      ret code chosen by the other player (the code-maker). The code is a sequence of
      4 colored pegs chosen from six colors available. The code-breaker makes a serie
      of pattern guesses - after each guess the code-maker gives feedback in the form
      of 2 numbers, the number of pegs that are of the right color and in the correct
      position, and the number of pegs that are of the correct color but not in the co
      rrect position - these numbers are usually represented by small black and white
      pegs.
      In 1977, the mathematician Donald Knuth demonstrated that the code-breaker
      can solve the pattern in five moves or less, using an algorithm that progressiv
      ely reduced the number of possible patterns.}
    end

    def self.enter_name
      "So you would like to play!\n
      Start by telling me your name:"
    end

    def self.good_bye
      "Thankyou for playing MasterMind!\n
      GoodBye!"
    end

    def self.is_invalid
    puts  %q{Your entry is invalid. Please folow the instructions
            provided to fully enjoy the game}
    end

    def  self.generated_sequence_intermediate
      "I have generated a Intermediate sequence with five elements made up of:
      (b)lue, (g)reen, (y)ellow  (r)ed and (o)range. You are to guess the sequence in which
      the colors appeared e.g BGYRO for (b)lue, (g)reen, (y)ellow  (r)ed and (o)range. Use (q)uit at any time to end the game.
      Ready to play?
      What's your guess"
  end

  def  self.generated_sequence_beginner
    "I have generated a beginner sequence with four elements made up of:
    (b)lue, (g)reen, (y)ellow and (r)ed. You are to guess the sequence in which the
    colors appeared e.g BGYR for (b)lue, (g)reen, (y)ellow and (r)ed. Use (q)uit at any time to end the game.
    Ready to play?
    What's your guess?"
end

def  self.generated_sequence_advanced
    %q{I have generated a beginner sequence with four elements made up of:
    (b)lue, (g)reen, (y)ellow  (r)ed (o)range and (c)yan. You are to guess the sequence in which the
    se colors appeared e.g BGYROC for (b)lue, (g)reen, (y)ellow  (r)ed (o)range and (c)yan. Use (q)uit at any time to end the game.
    Ready to play?
    What's your guess?}
end

end
