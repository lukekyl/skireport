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
    case input
      when "1"
        puts "Aspen weather is ..."
          #https://www.wunderground.com/weather/us/co/aspen/81611
      when "2"
        puts "Beaver Creek weather is ..."
          #https://www.wunderground.com/weather/us/co/avon/KCOAVON21
      when "3"
        puts "Breckenridge weather is ..."
          #https://www.wunderground.com/weather/us/co/breckenridge/KCOBRECK63
      when "4"
        puts "Copper Mountain weather is ..."
          #https://www.wunderground.com/weather/us/co/copper-mountain/80443
      when "5"
        puts "Crested Butte weather is ..."
          #https://www.wunderground.com/weather/us/co/crested-butte/81224
      when "6"
        puts "Keystone weather is ..."
          #https://www.wunderground.com/weather/us/co/dillon/KCODILLO40
      when "7"
        puts "Steamboat Springs weather is ..."
          #https://www.wunderground.com/weather/us/co/steamboat-springs/80487
      when "8"
        puts "Telluride weather is ..."
          #https://www.wunderground.com/weather/us/co/telluride/81435
      when "9"
        puts "Vail weather is ..."
          #https://www.wunderground.com/weather/us/co/vail/81657
      when "10"
        puts "Winter Park weather is ..."
          #https://www.wunderground.com/weather/us/co/winter-park/80482
      when "list"
        list_resorts
    end
  end
end

def goodbye
  puts "Thanks for using the Ski Conditions Reporter!"
  puts "Check back again tomorrow for updated resort conditions, Goodbye."
end

def site_link(input)
  case input
    when "1" #Aspen
      link =  "https://www.wunderground.com/weather/us/co/aspen/81611"
    when "2" #Beaver Creek
      link = "https://www.wunderground.com/weather/us/co/avon/KCOAVON21"
    when "3" #Breckenridge
      link = "https://www.wunderground.com/weather/us/co/breckenridge/KCOBRECK63"
    when "4" #Copper Mountain
      link = "https://www.wunderground.com/weather/us/co/copper-mountain/80443"
    when "5" #Crested Butte
      link = "https://www.wunderground.com/weather/us/co/crested-butte/81224"
    when "6" #Keystone
      link = "https://www.wunderground.com/weather/us/co/dillon/KCODILLO40"
    when "7" #Steamboat Springs
      link = "https://www.wunderground.com/weather/us/co/steamboat-springs/80487"
    when "8" #Telluride
      link = "https://www.wunderground.com/weather/us/co/telluride/81435"
    when "9" #Vail
      link = "https://www.wunderground.com/weather/us/co/vail/81657"
    when "10" #Winter Park
      link = "https://www.wunderground.com/weather/us/co/winter-park/80482"
  end
  link
end

def scrape_conditions(link)
  
end

end
