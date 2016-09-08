class MoviesComingSoon::Movie
  attr_accessor :name, :times

  def self.today
    self.scrape_IMBD
  end

  def self.scrape_IMBD
    doc = Nokogiri::HTML(open("http://www.imdb.com/movies-coming-soon/"))
    movie = self.new

    movie.name = doc.search(".overview-top h4").text
    movie
  end
end
