class MoviesComingSoon::Movies
  attr_accessor :name, :times
  @movies = []

  def self.today
    self.scrape_IMBD
  end

  def self.scrape_IMBD
    doc = Nokogiri::HTML(open("http://www.imdb.com/movies-coming-soon/"))
    list_of_movies = doc.search(".overview-top h4").text
    @movies = list_of_movies.split(%r{[)]}).collect do |movie|
      movie = movie + ")"
    end
    @movies
  end

end
