puts "Event Manager Initialized"

contents = File.read "event_attendees.csv"
puts contents

lines = File.readlines "event_attendees.csv"
lines.each do |line|
  puts line
end
