require 'pry'
require 'json'
class ReadFile

  def self.covert_time_to_string(time)
    min = time/ 60
    sec = time % 60
    time_in_string = min.to_s + ": " + sec.to_s
  end

  def self.average_time
    self.read_records
    average_time = 0
    @sorted_array.each do |each_hash|
      #binding.pry
      average_time += each_hash["time_taken"]
    end
    average_time = average_time / @sorted_array.length
    covert_time_to_string(average_time)
  end

  def self.average_guesses
    self.read_records
    total_guesses = 0
    @sorted_array.each do |each_hash|
      total_guesses += each_hash["trial_count"]
    end
    total_guesses = total_guesses / @sorted_array.length
  end

  def self.header_message(current_player, computer_code, trial_count, total_time)
    puts "====================== TOP TEN GAMERS =========================="
    puts "                                                                  "
    puts "#{current_player.name.capitalize}, you guessed the sequence #{computer_code.join("")} in #{self.covert_time_to_string(total_time)}.\n The average time is #{self.average_time} and the average guesses is#{self.average_guesses}"
  end


#Creates a hash of player details and appends it to @sorted_array if the score is enough to be on the top top_ten
  def self.add_records(current_player, computer_code, trial_count, total_time)
    self.read_records
    player_details = {
      "name" => current_player.name,
      "time_taken" => total_time,
      "guesses" => computer_code,
      "trial_count" => trial_count,
      "time_taken_string" => self.covert_time_to_string(total_time)
    }
      if total_time < @sorted_array.last["time_taken"]
        array_with_new_record = @sorted_array << player_details
        sorted_array_with_new_record = array_with_new_record.sort_by {|each_array| each_array["time_taken"]}
        sorted_array_with_new_record.each do |each_array|
          puts "#{each_array["name"].capitalize} solved #{each_array["guesses"]} in #{each_array["trial_count"]} in over #{each_array["time_taken_string"]}"
        end
        self.save_new_top_ten(sorted_array_with_new_record)
    end
  end
#Saves new sorted_array for every new score
  def self.save_new_top_ten(array)
    File.open("./lib/records.json", "w+") do |f|
      f.puts array.to_json
    end
  end

  #Returns a sorted array from the json file
    def self.read_records
    File.open("./lib/records.json", "r") do |file|
      file_items = JSON.parse(file.read)
      @sorted_array = file_items.sort_by {|each_hash| each_hash["time_taken"]}
    end
  end
end



#test = ReadFile.new
#puts test.read_records
