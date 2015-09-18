require_relative 'helper'
require_relative 'file'
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
    puts ReadFile.test_check(input)
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
        if user_guess == "q"
          system(exit)
        elsif user_guess == "c"
          puts @computer_code
        elsif too_long(user_guess) || too_short(user_guess)
            puts "Letter count not enough increase by #{computer_choice_array_length(@player[:level])}"
      elsif @computer_code != @result[:matches]
        puts "Try again"
        evaluate_guess(user_guess)
        puts "your choices #{userchoice} matched#{@result[:matches]} is #{trial_count}"
         trial_count += 1
         #binding.pry
       elsif @computer_code == @result[:matches]
               puts "Congratulations you have completed the game in #{trial_count}"
             @player[:end_time] = Time.now
             @player[:trial_count] = trial_count
             system(exit)
      end
    end
  end

  def evaluate_guess(user_guess)
      @result[:matches] = []
      @result[:nomatches] = []
      @result[:missed_matches] = []
      userchoice = user_guess.upcase.split("")
      combined_array = @computer_code.zip(userchoice)
      matches_array = combined_array.select do |each_array|
     if each_array[0] == each_array[1]
         @result[:matches] << each_array[0]
     end
 end
    partial_array = combined_array - matches_array
    partial_array.each do |each_array|
      if userchoice.include? each_array[0]
          @result[:nomatches] << each_array[0]
      else
          @result[:missed_matches] << each_array[0]
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

  def gather_details
    name = @player[:name]
    computer_code = @computer_code
    end_time = @player[:end_time]
    start_time = @player[:start_time]
    trial_count = @player[:trial_count]
    ReadFile.add_record(name, computer_code, end_time, start_time, trial_count)
    ReadFile.show_top_ten
    ReadFile.save_new_top_ten
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



test = Game.new

test.welcome
