require 'pry'
class Game
attr_accessor :user_name, :user_level
  def initialize(user_guess)
  #@user_name = user_name
  #@user_level = user_level
  @result = {matches: [], nomatches: [], missed_matches: []}
  @computer_code = %w{R B G Y}
  end

  def start
    puts %q{Add gueeses for color}
    user_guess = gets.chomp
    evaluate_guess(user_guess)
  end

  def evaluate_guess(user_guess)
    #
    userchoice = user_guess.upcase.split("")
    combined_array = @computer_code.zip(userchoice)
    binding.pry
    @combined_array_hashed = {}
    combined_array.each do |array|
        combined_array_hashed[array[0]] = array[1]
        binding.pry
    end

    @combined_array_hashed.each do |key, value|
      if key == value
        @result[:matches] << value
      elsif @user_guess.include? key
        @result[:nomathes] << value
      else
      @result[:missed_matches] << value
      end
    end
      p @result[:matches]
      p @result[:nomatches]
      p @result[:missed_matches]
  end
end

test = Game.new("gyrb")

test.start
