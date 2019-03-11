require 'pry'

def get_first_name_of_season_winner(data, season)
  winner_name = nil
  data[season].each do |contestant|
    if contestant["status"] == "Winner"
      winner_name = contestant["name"]
    end
  end
  winner_name.split[0]
end

def get_contestant_name(data, occupation)
  occupation_name = nil
  data.each do |season, contestants_array|
    contestants_array.each do |contestant_hash|
      if contestant_hash["occupation"] == occupation
        occupation_name = contestant_hash["name"]
      end
    end
  end
  occupation_name
end

def count_contestants_by_hometown(data, hometown)
  hometown_count = 0
  data.each do |season, contestants_array|
    contestants_array.each do |contestant_hash|
      if contestant_hash["hometown"] == hometown
        hometown_count += 1
      end
    end
  end
  hometown_count
end

def get_occupation(data, hometown)
  occupation_name = nil
  data.each do |season, contestants_array|
    contestants_array.each do |contestant_hash|
      if contestant_hash["hometown"] == hometown
        occupation_name = contestant_hash["occupation"]
        break
      end
    end
  end
  occupation_name
end

def get_average_age_for_season(data, season)
  age_array = []
  data[season].each do |contestant|
    age_array << contestant["age"]
  end
  age_array_numbers = age_array.collect do |age|
    age.to_f
  end
  decimal_average = age_array_numbers.inject{ |sum, el| sum + el }.to_f / age_array_numbers.size
  integer_average = decimal_average.round
end
