require 'csv'
require 'erb'

def clean_zipcode(zipcode)
  # if the zip code is exactly five(5) digits, assume that it is ok
  # if the zip code is more than five(5) digits, truncate it to the first 5 digits
  # if the zip code is less than five(5) digits, add zeros(0) to the front until it becomes five digits
  zipcode.to_s.rjust(5, "0")[0..4]
end

def save_thank_you_letters(id, form_letter)
  Dir.mkdir("output") unless Dir.exists? "output"
  filename = "output/thanks_#{ id }.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end
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

template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
  id = row[0]
  first_name = row[:first_name]
  zip_code = clean_zipcode(row[:zipcode])

  form_letter = erb_template.result(binding)

  save_thank_you_letters(id, form_letter)
end
