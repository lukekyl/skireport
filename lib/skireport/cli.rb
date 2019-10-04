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
  puts "Which ski resort's conditions would you like to check? (Type list to see your options again, and exit to quit.)"
  input = nil
  while input != "exit"
    input = gets.strip.downcase
    if input == "list"
        list_resorts
    elsif input.to_i >= 0 && input.to_i <= 10
        site_link(input)
    else
      puts "Please type a valid resort number, list, or exit."
    end
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
      puts "#{name} link is #{link}"
    when "2"
      name = "Beaver Creek"
      link = "https://www.wunderground.com/weather/us/co/avon/KCOAVON21"
      puts "#{name} link is #{link}"
    when "3"
      name = "Breckenridge"
      link = "https://www.wunderground.com/weather/us/co/breckenridge/KCOBRECK63"
      puts "#{name} link is #{link}"
    when "4"
      name = "Copper Mountain"
      link = "https://www.wunderground.com/weather/us/co/copper-mountain/80443"
      puts "#{name} link is #{link}"
    when "5"
      name = "Crested Butte"
      link = "https://www.wunderground.com/weather/us/co/crested-butte/81224"
      puts "#{name} link is #{link}"
    when "6"
      name = "Keystone"
      link = "https://www.wunderground.com/weather/us/co/dillon/KCODILLO40"
      puts "#{name} link is #{link}"
    when "7"
      name = "Steamboat Springs"
      link = "https://www.wunderground.com/weather/us/co/steamboat-springs/80487"
      puts "#{name} link is #{link}"
    when "8"
      name = "Telluride"
      link = "https://www.wunderground.com/weather/us/co/telluride/81435"
      puts "#{name} link is #{link}"
    when "9"
      name = "Vail"
      link = "https://www.wunderground.com/weather/us/co/vail/81657"
      puts "#{name} link is #{link}"
    when "10"
      name = "Winter Park"
      link = "https://www.wunderground.com/weather/us/co/winter-park/80482"
      puts "#{name} link is #{link}"
  end
  get_resort(name,link)
  link
end

def get_resort(name, link)
  resort = SkiReport::Resort.new(name)
  resort.scrape_conditions(link)
  p resort
end

end
