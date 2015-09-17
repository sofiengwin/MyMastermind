class Game
attr_accessor :user_name, :user_level
  def initialize
  #@user_name = user_name
  @player = Hash.new(0)
  @result = {matches: [], nomatches: [], missed_matches: []}
  @computer_code = %w{G G Y B}
  end

  def welcome
    puts Message.welcome
    input = gets.chomp

    case input
    when "p"
      choose_level
    when "q"
      system(exit)
    when "i"
      Message.show_background
    end
  end

  def choose_level
    puts Message.choose_level
    @player[:level] = gets.chomp
    enter_name
  end

  def enter_name
    puts Message.enter_name
    @player[:name] = gets.chomp
    start
  end

  def start
      trial_count = 1
    puts Message.generated_sequence
    until trial_count >= 12
      user_guess = gets.chomp
      userchoice = user_guess.upcase.split("")
      if @computer_code == user_guess.upcase.split("")
          puts "Congratulations you have completed the game in #{trial_count}"
          break
      elsif too_long(userchoice) || too_short(userchoice)
          puts "Please enter a valid length"
      else
        puts "Try again"
        evaluate_guess(user_guess)
        puts "#{@result[:matches]} is #{trial_count}"
         trial_count += 1
      end
    end
  end

  def evaluate_guess(user_guess)
    userchoice = user_guess.upcase.split("")
    combined_array = @computer_code.zip(userchoice)
    @combined_array_hashed = {}
    combined_array.each do |array|
        @combined_array_hashed[array[0]] = array[1]
    end

    @combined_array_hashed.each do |key, value|
      if key == value
        @result[:matches] << value
      elsif userchoice.include? key
        @result[:nomatches] << value
      else
      @result[:missed_matches] << value
      end
    end
    @result
  end

  def too_long(user_guess)
      user_guess.length > 4
  end

  def too_short(user_guess)
    user_guess.length < 4
  end
end

class Message
    def self.welcome
        %q{Would you like to (p)lay, read the (i)nstructions,
          read a little (b)ackground on MasterMind or (q)uit?}
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



test = Game.new

test.welcome
