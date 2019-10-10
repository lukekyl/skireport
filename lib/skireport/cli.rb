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
  resorts = SkiReport::Links.getlink
  resorts.each_with_index{|resort, index|
    puts "#{index}. #{resort[:name]}" if index > 0
  }
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
  resort_array = SkiReport::Links.getlink
  name = resort_array[input.to_i][:name]
  link = resort_array[input.to_i][:link]
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
