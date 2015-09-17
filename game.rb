require 'pry'
class Game
attr_accessor :user_name, :user_level
  def initialize
  #@user_name = user_name
  @player = Hash.new(0)
  @result = {matches: [], nomatches: [], missed_matches: []}
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
    else
      puts "Option Invalid. Try following the instructions"
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

  def generate_sequence
    colors = %w{A B C D E F G H}
    generated_code = []
    computer_choice_array_length(@player[:level]).times{ generated_code << colors[rand(computer_choice_length(@player[:level]))] }
    generated_code
end

  def start
    @computer_code = generate_sequence
    @player[:start_time] = Time.now
      trial_count = 1
    puts Message.generated_sequence
    until trial_count >= 12
      user_guess = gets.chomp
      userchoice = user_guess.upcase.split("")
      if @computer_code == @result[:matches]
          puts "Congratulations you have completed the game in #{trial_count}"
        @player[:end_time] = Time.now
        @player[:trial_count] = trial_count
        #binding.pry
          break
        elsif user_guess == "q"
          system(exit)
        elsif user_guess == "c"
          puts @computer_code
        elsif too_long(user_guess) || too_short(user_guess)
            puts "Letter count not enough increase by #{computer_choice_array_length(@player[:level])}"
      else
        puts "Try again"
        evaluate_guess(user_guess)
        puts "your choices #{userchoice} matched#{@result[:matches]} is #{trial_count}"
         trial_count += 1
         #binding.pry
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
    #binding.pry
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
      user_guess.length > computer_choice_array_length(@player[:level])
  end

  def too_short(user_guess)
    user_guess.length < computer_choice_array_length(@player[:level])
  end

  def computer_choice_array_length(player)
    if player == "2"
    return 6
    elsif player == "3"
    return 8
  else
    return 4
    end
  end

  def computer_choice_length(player)
    if player == "2"
    return 5
    elsif player == "3"
    return 6
  else
    return 4
    end
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
