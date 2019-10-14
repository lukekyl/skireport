class SkiReport::CLI
  def call
    welcome
    create_list
    list_resorts
    menu
    goodbye
  end

  def welcome
    puts <<-DOC
    Welcome to the Ski Conditions Reporter!
    Use this program to find current conditions at your favorite resort.

    DOC
  end
  def create_list
    resorts = SkiReport::Links.getlink.map { |resort_hash|
      SkiReport::Resort.new(resort_hash[:name], resort_hash[:link])
    }
  end
  def list_resorts
    puts "Available ski resorts include:"

    SkiReport::Resort.all.each_with_index{|resort, index|
      puts "#{index + 1}. #{resort.name}"
    }
  end
  def menu
    puts <<-DOC

    Which ski resort's conditions would you like to check? (Type list to see your resort options again, and exit to quit.)
    DOC
    input = nil
    while input != -1
      input = gets.strip.downcase
      if input == "list"
        list_resorts
      elsif input == "exit"
        input = -1
      elsif input.to_i > 0 && input.to_i <= SkiReport::Resort.all.count
        site_link(input)
      else
        puts <<-DOC
        
        Please type a valid resort number, list, or exit.
        DOC
      end
      input
    end
  end
  def goodbye
    puts <<-DOC

    Thanks for using the Ski Conditions Reporter!
    Check back again tomorrow for updated resort conditions, Goodbye.
    DOC
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
    resort = SkiReport::Resort.find_by_name(name)
    resort.scrape_conditions
    resort
  end
end
