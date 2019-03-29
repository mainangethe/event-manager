require "csv"
puts "--------------------------------------------------"
puts "Event Manager Initialized".center(50)
puts "--------------------------------------------------"
puts
# Option - 1
# Build a CSV Parser
# contents = File.read "event_attendees.csv"
# puts contents
#
# lines = File.readlines "event_attendees.csv"
# lines.each_with_index do |line, index|
#   next if index == 0
#   columns = line.split(',')
#   name = columns[2]
#   puts name
# end

# Option 2
# Use a CSV parser
# It will have more options beyond our custom one

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
  first_name = row[:first_name]
  zip_code = row[:zipcode]
  puts "#{ first_name } : #{ zip_code }"
end
