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
      when "2"
        puts "Beaver Creek weather is ..."
      when "3"
        puts "Breckenridge weather is ..."
      when "4"
        puts "Copper Mountain weather is ..."
      when "5"
        puts "Crested Butte weather is ..."
      when "6"
        puts "Keystone weather is ..."
      when "7"
        puts "Steamboat Springs weather is ..."
      when "8"
        puts "Telluride weather is ..."
      when "9"
        puts "Vail weather is ..."
      when "10"
        puts "Winter Park weather is ..."
      when "list"
        list_resorts
    end
  end
end

def goodbye
  puts "Thanks for using the Ski Conditions Reporter!"
  puts "Check back again tomorrow for updated resort conditions, Goodbye."
end

end
