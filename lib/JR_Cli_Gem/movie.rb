class MoviesComingSoon::Movie
  attr_accessor :name, :description, :new


  def self.today
    self.scrape_IMBD

  end

  def self.scrape_IMBD
    movies = []
    doc = Nokogiri::HTML(open("http://www.imdb.com/movies-coming-soon/"))
    movies = doc.css(".overview-top h4 a").collect do |movie|
      movie.text
    end

  end

end
