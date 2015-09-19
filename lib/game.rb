require_relative 'helper'
require_relative 'file'
require_relative 'player'
require 'pry'
require 'colorize'
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
      puts Message.show_instruction
      welcome
    when "b"
      puts Message.show_background
      welcome
    else
      puts "Option Invalid. Try following the instructions".red
      welcome
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
    colors = %w{B G Y R O C}
    generated_code = []
    computer_choice_array_length(@player[:level]).times{ generated_code << colors[rand(computer_choice_length(@player[:level]))] }
    generated_code
  end

#Dynamic color generation logic based on the level the player selects

  def start
    @hint = nil
    @computer_code = generate_sequence
    @player[:start_time] = Time.now
      trial_count = 1
    puts  generated_sequence_message(@player[:level])
    until trial_count >= 13
      user_guess = gets.chomp
      userchoice = user_guess.upcase.split("")
      evaluate_guess(user_guess)
        if user_guess == "q"
          system(exit)
        elsif user_guess == "c"
          puts @computer_code
        elsif user_guess == "h"
          puts "The sequence starts with #{@computer_code.take(computer_choice_array_length(@player[:level])/2)}".green
          @hint == false ? trial_count + 2 : trial_count += 0
          @hint = true
        elsif too_long(user_guess)
            puts "Letter count too long. Letter count for this level must be #{computer_choice_array_length(@player[:level])}".red
        elsif too_short(user_guess)
            puts "Letter too short. Letter count for this level must be #{computer_choice_array_length(@player[:level])}".red
      elsif @computer_code != @result[:matches]
        puts "Try again"
        puts "your choice #{userchoice} you have #{@result[:matches].length} matches and #{@result[:nomatches].length} partial matches in #{trial_count}"
         trial_count += 1
         #binding.pry
       elsif @computer_code == @result[:matches]
               puts "Congratulations you have completed the game in #{trial_count}".green
             @player[:end_time] = Time.now
             name = @player[:name]
             computer_code = @computer_code
             level = @player[:level]
             total_time = Time.now.to_i - @player[:start_time].to_i
             current_player = Player.new(name, user_level)
             ReadFile.header_message(current_player, computer_code, trial_count, total_time)
             ReadFile.add_records(current_player, computer_code, trial_count, total_time)
             system(exit)
           #elsif trial_count == 12
            # puts "Sorry You Failed. Try again next time"
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

  def generated_sequence_message(player)
    if player == "2"
      return Message.generated_sequence_intermediate
    elsif player == "3"
      return Message.generated_sequence_advanced
    else
      return Message.generated_sequence_beginner
    end
  end

end
