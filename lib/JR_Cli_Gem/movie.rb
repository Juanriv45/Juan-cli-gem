class AlamoTimes::Movie
  attr_accessor :name, :times

  def self.today
    self.scrape_alamo
  end

  def self.scrape_alamo
    doc = Nokogiri::HTML(open("http://www.imdb.com/movies-coming-soon/"))
    movie = self.new

    movie.name = doc.search(".overview-top h4").text
    movie
  end
end
