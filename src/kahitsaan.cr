require "option_parser"
require "json"
require "./kahitsaan/*"

area = "greenbelt"
limit = 1

OptionParser.parse! do |parser|
  parser.banner = "Usage: kahitsaan [arguments]"
  parser.on("-i", "--in=AREA", "Area to search for") { |input| area = input }
  parser.on("-s", "--sa=AREA", "Lugar na titingnan natin") { |input| area = input }
  parser.on("-l", "--limit=LIMIT", "Number of results to output (default 1)") { |input| limit = input.to_i }
  parser.on("-h", "--help", "Show this help") { puts parser }
end

location_details = Kahitsaan.get_location_details area

if location_details != nil
  details = location_details.as(NamedTuple)
  restaurants = Kahitsaan.get_restaurant(limit.as(Int32), **details)

  if restaurants != nil
    restaurants.as(Array(JSON::Any)).each do |resto|
      puts resto["name"]
      puts resto["url"]
    end
  else
    puts "No restaurants found in #{area}"
  end
else
  puts "We cannot find #{area}"
end
