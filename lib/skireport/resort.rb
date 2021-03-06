class SkiReport::Resort
  attr_accessor :name, :current, :high, :low, :condition, :snow, :link
  @@all = []

  def initialize(name, link)
    @name = name
    @link = link
    save
  end
  def self.find_by_name(name)
    all.detect { |r| r.name == name}
  end
  def save
    @@all << self
  end
  def self.all
    @@all
  end

  def scrape_conditions
    unless @scraped
      doc = Nokogiri::HTML(open(link))
      self.current = doc.css("div.current-temp span.wu-value").text
      self.high = doc.css("span.hi").text.gsub("°","")
      self.low = doc.css("span.lo").text.gsub("°","")
      self.condition = doc.css("div.conditions-extra div.condition-icon p").text
      snow_report = doc.xpath('//*[@type="snow"]')
      self.snow = snow_report.css("span.wu-unit-snow span.wu-value-to").text

      @scraped = true
    end
  end

end
