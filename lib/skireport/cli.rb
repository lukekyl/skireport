class SkiReport::CLI

def call
  puts "Welcome to the Ski Conditions Reporter!"
  puts "Use this program to find current conditions at your favorite resort."
  list_resorts
  menu
  goodbye
end

def list_resorts
  puts "Available ski resorts include:"
  puts <<-DOC
    1. Aspen
    2. Beaver Creek
    3. Breckenridge
    4. Copper Mountain
    5. Crested Butte
    6. Keystone
    7. Steamboat Springs
    8. Telluride
    9. Vail
    10. Winter Park
  DOC
end

def menu
  puts "Which ski resort's conditions would you like to check? (Type list to see your resort options again, and exit to quit.)"
  input = nil
  while input != -1
    input = gets.strip.downcase
    if input == "list"
      list_resorts
    elsif input == "exit"
      input = -1
    elsif input.to_i > 0 && input.to_i <= 10
      site_link(input)
    else
      puts "Please type a valid resort number, list, or exit."
    end
    input
  end
end


def goodbye
  puts "Thanks for using the Ski Conditions Reporter!"
  puts "Check back again tomorrow for updated resort conditions, Goodbye."
end

def site_link(input)
  case input
    when "1"
      name = "Aspen"
      link =  "https://www.wunderground.com/weather/us/co/aspen/81611"
    when "2"
      name = "Beaver Creek"
      link = "https://www.wunderground.com/weather/us/co/avon/KCOAVON27"
    when "3"
      name = "Breckenridge"
      link = "https://www.wunderground.com/weather/us/co/breckenridge/KCOBRECK63"
    when "4"
      name = "Copper Mountain"
      link = "https://www.wunderground.com/weather/us/co/copper-mountain/80443"
    when "5"
      name = "Crested Butte"
      link = "https://www.wunderground.com/weather/us/co/crested-butte/81224"
    when "6"
      name = "Keystone"
      link = "https://www.wunderground.com/weather/us/co/dillon/KCODILLO40"
    when "7"
      name = "Steamboat Springs"
      link = "https://www.wunderground.com/weather/us/co/steamboat-springs/80487"
    when "8"
      name = "Telluride"
      link = "https://www.wunderground.com/weather/us/co/telluride/81435"
    when "9"
      name = "Vail"
      link = "https://www.wunderground.com/weather/us/co/vail/81657"
    when "10"
      name = "Winter Park"
      link = "https://www.wunderground.com/weather/us/co/winter-park/80482"
  end
  print_conditions(name,link)
  puts <<-DOC

  For a closer look at the weather in #{name}, follow this link:
  #{link}

  (Type list to see your resort options again, and exit to quit.)
  DOC
end

def print_conditions(name,link)
  resort = get_resort(name, link)
  puts <<-DOC
  #{resort.name} Ski Resort:
  Current Weather is #{resort.current}°f and #{resort.condition}
  Todays High - #{resort.high}°f
  Todays Low - #{resort.low}°f
  Snow Depth - #{resort.snow} inches
  DOC
end

def get_resort(name, link)
  resort = SkiReport::Resort.new(name)
  resort.scrape_conditions(link)
  resort
end

end
