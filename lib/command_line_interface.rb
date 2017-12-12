def welcome
  puts "Hello!"
end

def get_character_from_user
  puts "please enter a character"
  # use gets to capture the user's input. This method should return that input, downcased.
  input = gets.chomp
  input.downcase!
  input_array = input.split
  formatted_name_array = input_array.map{|word| word.capitalize}
  formatted_name = formatted_name_array.join(" ")
  formatted_name
end
