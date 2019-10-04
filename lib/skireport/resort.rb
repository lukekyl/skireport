class SkiReport::Resort
  attr_accessor :name, :current, :high, :low, :precip, :snow
  @@all = []
  # Ski Conditions at:
  # Beaver Creek Ski Resort
  # Current Weather is 49 f and Sunny
  # Todays High - 53 f
  # Todays Low - 30 f
  # Chance of Precip. - 0%
  # Snow Depth - 1 in
  # Tomorrows High - 50 f
  def initialize(name)
    @name = name
    save
  end
  def save
    @@all << self
  end
  def self.all
    @@all
  end

  def scrape_conditions(link)
    doc = Nokogiri::HTML(open(link))
    self.current = doc.search("div.current-temp span.wu-value").text
    self.high = doc.search("span.hi").text
    self.low = doc.search("span.lo").text
    self.precip = doc.search("div#precipBarChart text").text
    self.snow = doc.search("span.wu-unit-snow span.wu-value-to").text
  end

end
